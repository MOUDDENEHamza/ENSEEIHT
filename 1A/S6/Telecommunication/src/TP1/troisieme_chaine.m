%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Télécommunications
% TP1 -  Études de chaines de transmission en bande de base
% troisieme_chaine.m
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Initialisation
%--------------------------------------------------------------------------
clear;
close all;
clc;

%%
%--------------------------------------------------------------------------
% Troisième chaine à étudier : impact du choix du filtre de mise en 
% forme et d’un canal de propagation à bande limitée
%--------------------------------------------------------------------------

% Initialisation des paramètres
Fe = 12000;     % Fréquence d’échantillonnage
Rs = 3000;      % Rythme symbole par seconde
alpha = 0.5;    % Roll off  
Ns = Fe / Rs;   % Durée symbole en nombre d’échantillons (Ts=NsTe)
nb_bits = 1000; % Nombre de bits générés

%%
%--------------------------------------------------------------------------
% Implantation de la chaine sans bruit
%--------------------------------------------------------------------------
bits = randi([0, 1], 1, nb_bits);     % Génération de l’information binaire
Symboles = 2 * bits - 1;    % Mapping binaire à moyenne nulle : 0->-1, 1->1

% Génération de la suite de Diracs pondérés par les symbols (suréchantillonnage)
Suite_diracs = kron(Symboles, [1 zeros(1, Ns - 1)]);

% Génération de la réponse impulsionnelle du filtre de mise en forme
h = rcosdesign(alpha, 8, Ns, 'sqrt');
retard = 4 * Ns;

% Filtrage de mise en forme
x = filter(h, 1, [Suite_diracs zeros(1,retard)]);
x = x(retard + 1 : end);

% BW = 1500 Hz
Fc = 1500;
h_canal = 2 * Fc * (1 / Fe) * sinc(2 * Fc * [-50 * (1 / Fe) : (1 / Fe) : 50 * (1 / Fe)])';
x_canal = filter(h_canal, 1, [x zeros(1,retard)]);
x_canal = x_canal(retard + 1 : end);
x_r = filter(h, 1, [x_canal zeros(1,retard)]);
x_r = x_r(retard + 1 : end);

Ts = 4;
oeil = reshape(x_r, 2*Ts, length(x_r)/(2*Ts)); %  [] = nombre de colonnes de 2*Ts valeurs
figure;
plot(oeil); % superpose les différentes colonnes
axis([1 2*Ts (-Ns-1) (Ns+1)]);
title("Figure 7 : diagramme de l'oeil en sortie du filtre de réception avec passage dans un canal de transmission (BW = 1500 Hz)");

% BW = 3000 Hz
Fc = 3000;
h_canal = 2 * Fc * (1 / Fe) * sinc(2 * Fc * [-50 * (1 / Fe) : (1 / Fe) : 50 * (1 / Fe)])';
x_canal = filter(h_canal, 1, [x zeros(1,retard)]);
x_canal = x_canal(retard + 1 : end);
x_r = filter(h, 1, [x_canal zeros(1,retard)]);
x_r = x_r(retard + 1 : end);

Ts = 4;
oeil = reshape(x_r, 2*Ts, length(x_r)/(2*Ts)); %  [] = nombre de colonnes de 2*Ts valeurs
figure;
plot(oeil); % superpose les différentes colonnes
axis([1 2 * Ts (-Ns - 1) (Ns + 1)]);
title("Figure 8 : diagramme de l'oeil en sortie du filtre de réception avec passage dans un canal de transmission (BW = 3000 Hz)");

% Génération de la réponse impulsionnelle du filtre de réception
h_r = h;

% Filtrage de réception
z = filter(h_r, 1, [x zeros(1,retard)]);
z = z(retard + 1 : end);

% Affichage du signal reçu
figure ; 
plot(z);
axis([0 nb_bits - 1 -1.5 1.5]);
title('Figure 1 : signal reçu z sans bruit');
xlabel('Temps en secondes');
ylabel('Signal reçu z');

% Le diagramme de l’oeil en sortie du filtre de réception
diagramme_oeil = reshape(z, Ns, length(z) / Ns);
figure;
plot(diagramme_oeil);
title("Figure 2 : Diagramme de l'oeil sans bruit");

% Echantillonnage du signal
z_echant = z(1 : Ns : end);

% Detecteur à seuil
symboles_decides = sign(z_echant);
TES = length(find(symboles_decides ~= Symboles) / length(Symboles));

% Demapping
bits_decides = (symboles_decides + 1) / 2;
TEB = length(find(bits_decides ~= bits) / length(bits))

%%
% Calcul de la DSP du signal par périodogramme
DSP_z = (1 / length(z)) * abs(fft(z, 2 ^ nextpow2(length(z)))) .^ 2;

%Calcul de la DSP de la chaine de réference
x1 = filter(ones(1, Ns), 1, Suite_diracs);
z1 = filter(ones(1, Ns), 1, x1);
DSP_z1 = (1 / length(z1)) * abs(fft(z1, 2 ^ nextpow2(length(z1)))) .^ 2;

% Affichage de la DSP de la chaine courante et la chaine de réference
figure;
hold on;
plot(linspace(-1, 1, length(DSP_z1)), fftshift(DSP_z1));
plot(linspace(-1, 1, length(DSP_z)), fftshift(DSP_z));
hold off;
title('Figure 6 : DSP du signal transmis pour la chaine de réference et la 3ième chaine');
legend('chaine de réference', 'troisième chaine');
xlabel('Fréquence en Hz');
ylabel('S_{x}(f)');

%%
%--------------------------------------------------------------------------
% Implantation de la chaine avec bruit
%--------------------------------------------------------------------------
N = randn(1, length(x));
Puiss_sign = mean(abs(x) .^ 2);
Eb_N0_dB = 10;
Puiss_bruit = Puiss_sign * Ns  / (2 * log2(2) * 10 ^ (Eb_N0_dB / 10));
Bruit_gauss = sqrt(Puiss_bruit) * N;
y = x + Bruit_gauss;

% Filtrage de réception
z = filter(h_r, 1, [y zeros(1,retard)]);
z = z(retard + 1 : end);

% Affichage du signal reçu
figure ; 
plot(z);
axis([0 nb_bits - 1 -1.5 1.5]);
title('Figure 3 : signal reçu z avec bruit');
xlabel('Temps en secondes');
ylabel('Signal reçu z');

% Le diagramme de l’oeil en sortie du filtre de réception
diagramme_oeil = reshape(z, 2 * Ns, length(z) / (2 * Ns));
figure;
plot(diagramme_oeil);
title("Figure 4 : Diagramme de l'oeil du signal reçu avec bruit");

% Echantillonnage du signal
z_echant = z(1 : Ns : end);

% Detecteur à seuil
symboles_decides = sign(z_echant);
TES = length(find(symboles_decides ~= Symboles) / length(Symboles));

% Demapping
bits_decides = (symboles_decides + 1) / 2;
TEB = length(find(bits_decides ~= bits) / length(bits));

%%
TEB = zeros(1, 6);
for Eb_N0_dB = 0 : 6
    % Ajouter le bruit
    N = randn(1, length(x));
    Puiss_sign = mean(abs(x) .^ 2);
    Puiss_bruit = Puiss_sign * Ns  / (2 * log2(2) * 10 ^ (Eb_N0_dB / 10));
    Bruit_gauss = sqrt(Puiss_bruit) * N;
    y = x + Bruit_gauss;
    
    % Filtrage de réception
    z = filter(h_r, 1, [y zeros(1,retard)]);
    z = z(retard + 1 : end);
    
    % Echantillonnage du signal
    z_echant = z(1 : Ns : end);
    
    % Detecteur à seuil
    symboles_decides = sign(z_echant);
    TES = length(find(symboles_decides ~= Symboles) / length(Symboles));

    % Demapping
    bits_decides = (symboles_decides + 1) / 2;
    TEB(Eb_N0_dB + 1) = length(find(bits_decides ~= bits)) / length(bits);
end

figure;
semilogy([0 : 6], TEB, 'r*');
hold on
semilogy([0 : 6], qfunc(sqrt((2 * 10 .^ ([0 : 6] / 10)))));
grid
title('Figure 5 : Comparaison entre le TEB théorique et estimé');
legend('TEB estimé','TEB théorique')
xlabel("$\frac{Eb}{N_{o}}$ (dB)", 'Interpreter', 'latex');
ylabel('TEB');