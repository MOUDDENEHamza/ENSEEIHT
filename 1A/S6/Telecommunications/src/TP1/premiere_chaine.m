%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Télécommunications
% TP1 - Etudes de chaines de transmission en bande de base
% premiere_chaine.m
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Initialisation
%--------------------------------------------------------------------------
clear;
close all;
clc;

%%
%--------------------------------------------------------------------------
% Première chaine à ́etudier : chaine de référence
%--------------------------------------------------------------------------

% Initialisation des paramètres
Ns = 4;                  % Durée symbole en nombre d’échantillons (Ts=NsTe)
nb_bits = 1000;          % Nombre de bits générés

%%
%--------------------------------------------------------------------------
% Implantation de la chaine sans bruit
%--------------------------------------------------------------------------
bits = randi([0, 1], 1, nb_bits);     % Génération de l’information binaire
Symboles = 2 * bits - 1;    % Mapping binaire à moyenne nulle : 0->-1, 1->1

% Génération de la suite de Diracs pondérés par les symbols (suréchantillonnage)
Suite_diracs = kron(Symboles, [1 zeros(1, Ns - 1)]);

% Génération de la réponse impulsionnelle du filtre de mise en forme (NRZ)
h = ones(1, Ns);

% Filtrage de mise en forme
x = filter(h, 1, Suite_diracs);

% Affichage du signal généré
figure ; 
plot(x);
axis([0 nb_bits - 1 -1.5 1.5]);
title('Figure 1 : signal généré x');
xlabel('Temps en secondes');
ylabel('Signal généré x');

% Génération de la réponse impulsionnelle du filtre de réception
h_r = ones(1, Ns);

% Filtrage de réception
z = filter(h_r, 1, x);

% Affichage du signal reçu
figure ; 
plot(z);
axis([0 nb_bits - 1 -1.5 1.5]);
ylim([-5, 5]);
title('Figure 2 : signal reçu z sans bruit');
xlabel('Temps en secondes');
ylabel('Signal reçu z');

% Le diagramme de l’oeil en sortie du filtre de réception
diagramme_oeil = reshape(z, Ns, length(z) / Ns);
figure;
plot(diagramme_oeil);
title("Figure 3 : Diagramme de l'oeil sans bruit");

% Echantillonnage du signal
z_echant = z(Ns : Ns : end);

% Detecteur à seuil
symboles_decides = sign(z_echant);

% TES
TES = length(find(symboles_decides ~= Symboles) / length(Symboles));

% Demapping
bits_decides = (symboles_decides + 1) / 2;

% TEB
TEB = length(find(bits_decides ~= bits) / length(bits));

%%
% Calcul de la DSP du signal par périodogramme
DSP_z = (1 / length(z)) * abs(fft(z, 2 ^ nextpow2(length(z)))) .^ 2;

% Affichage de la DSP du signal transmis
figure;
plot(linspace(-1, 1, length(DSP_z)), fftshift(DSP_z));
title('Figure 4 : DSP du signal transmis pour la chaine de réference');
xlabel('Fréquences en Hz');
ylabel('S_{x}(f)');

%%
%--------------------------------------------------------------------------
% Implantation de la chaine avec bruit
%--------------------------------------------------------------------------
% L'ajout du bruit blanc gaussien 
N = randn(1, length(x));
Puiss_sign = mean(abs(x) .^ 2);
Eb_N0_dB = 10;
Puiss_bruit = Puiss_sign * Ns  / (2 * log2(2) * 10 ^ (Eb_N0_dB / 10));
Bruit_gauss = sqrt(Puiss_bruit) * N;
y = x + Bruit_gauss;

% Génération de la réponse impulsionnelle du filtre de réception
h_r = ones(1, Ns);

% Filtrage de réception
z = filter(h_r, 1, y);

% Affichage du signal reçu
figure ; 
plot(z);
axis([0 nb_bits - 1 -1.5 1.5]);
ylim([-5, 5]);
title('Figure 5 : signal reçu z avec bruit');
xlabel('Temps en secondes');
ylabel('Signal reçu z');

% Le diagramme de l’oeil en sortie du filtre de réception
diagramme_oeil = reshape(z, 2 * Ns, length(z) / (2 * Ns));
figure;
plot(diagramme_oeil);
title("Figure 6 : Diagramme de l'oeil du signal reçu avec bruit");

% Echantillonnage du signal
z_echant = z(Ns : Ns : end);

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
    z = filter(h_r, 1, y);
    
    % Echantillonnage du signal
    z_echant = z(Ns : Ns : end);
    
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
title('Figure 7 : Comparaison entre le TEB théorique et estimé');
legend('TEB estimé','TEB théorique')
xlabel("$\frac{Eb}{N_{o}}$ (dB)", 'Interpreter', 'latex');
ylabel('TEB');