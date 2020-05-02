%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Télécommunications
% TP1 -  Études de chaines de transmission en bande de base
% quatrieme_chaine.m
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Initialisation
%--------------------------------------------------------------------------
clear;
close all;
clc;

%%
%--------------------------------------------------------------------------
% Quatrième chaine à étudier : impact du choix du mapping
%--------------------------------------------------------------------------

% Initialisation des paramètres
Ns = 4;            % Durée symbole en nombre d’échantillons (Ts = Ns Te)
nb_bits = 10000;    % Nombre de bits générés

%--------------------------------------------------------------------------
% Implantation de la chaine sans bruit
%--------------------------------------------------------------------------
%%
% Génération de l’information binaire
bits = randi([0, 1], 1, nb_bits);

% Mapping 4-aires
Symboles = (2 * bi2de(reshape(bits, 2, length(bits)/2).') - 3).';

% Génération de la suite de Diracs pondérés par les symbols (suréchantillonnage)
Suite_diracs = kron(Symboles, [1 zeros(1, Ns - 1)]);

% Génération de la réponse impulsionnelle du filtre de mise en forme (NRZ)
h = ones(1, Ns);

% Filtrage de mise en forme
x = filter(h, 1, Suite_diracs);

% Affichage du signal généré
figure ;
plot(x);
axis([0 nb_bits - 1 -4 4]);
title('Figure 1 : signal généré x');
xlabel('Temps en secondes');
ylabel('Signal généré x');

%%
% Génération de la réponse impulsionnelle du filtre de réception
h_r = ones(1, Ns);

% Filtrage de réception
z = filter(h_r, 1, x);

% Affichage du signal reçu
figure ;
plot(z);
axis([0 nb_bits - 1 -13 13]);
title('Figure 4 : signal reçu z sans bruit');
xlabel('Temps en secondes');
ylabel('Signal reçu z');

% Le diagramme de l’oeil en sortie du filtre de réception
diagramme_oeil = reshape(z, Ns, length(z) / Ns);
figure;
plot(diagramme_oeil);
title("Figure 5 : Diagramme de l'oeil sans bruit");
%%
% Echantillonnage du signal
z_echant = z(Ns : Ns : end);

% Detecteur à seuil
symboles_decides = zeros(1, length(z_echant));
     
for i = 1 : length(z_echant)
    if (z_echant(i) > 2 * Ns)
        symboles_decides(i) = 3;
    elseif (z_echant(i) >= 0)
        symboles_decides(i) = 1;
    elseif (z_echant(i) < - 2 * Ns)
        symboles_decides(i) = -3;
    else
        symboles_decides(i) = -1;
    end
end

% Demapping
bits_decides = reshape(de2bi((symboles_decides + 3) / 2).', 1, length(bits));

% Taux d'erreurs binaires
TEB = length(find(bits_decides ~= bits) / length(bits))

%%
% Calcul de la DSP du signal par périodogramme
DSP_z =  (1 / length(z)) * abs(fft(z, 2 ^ nextpow2(length(z)))) .^ 2;

% Affichage de la DSP du signal transmis
figure;
plot(linspace(-1, 1, length(DSP_z)), fftshift(DSP_z));
title('Figure 4 : DSP du signal transmis pour la quatrième chaine');
xlabel('Fréquences en Hz');
ylabel('S_{x}(f)');

%Mapping binaire à moyenne nulle
Symboles_1 = 2 * bits - 1;

% Génération de la suite de Diracs pondérés par les symbols (suréchantillonnage)
Suite_diracs_1 = kron(Symboles_1, [1 zeros(1, Ns - 1)]);

%filtre de mise en forme
h_1 = ones(1, Ns);

%Filtrage de mise en forme
x_1 = filter(h_1, 1, Suite_diracs_1);

% Filtrage de réception
z1 = filter(h_1, 1, x_1);

% Calcul de la DSP du signal par périodogramme de la chaine de réference
DSP_z1 = (1 / length(z1)) * abs(fft(z1, 2 ^ nextpow2(length(z1)))) .^ 2;

%Affichage de la DSP du signal généré
figure;
hold on;
plot(linspace(0, 1, length(DSP_z)), fftshift(DSP_z),'r-');
plot(linspace(0, 1, length(DSP_z1)), fftshift(DSP_z1),'b-');
hold off;
title('Figure 3 : DSP de la chaine de réference et la chaine courante');
legend('chaine courante', 'chaine de réference');
xlabel('fréquence en Hz');
ylabel('S_{x}(f)');

%%
%--------------------------------------------------------------------------
% Implantation de la chaine avec bruit
%--------------------------------------------------------------------------
%%
TES = zeros(1,7);
TEB = zeros(1,7);
for i = 0 : 6
    % L'ajout du bruit blanc gaussien
    N = randn(1, length(x));
    Puiss_sign = mean(abs(x) .^ 2);
    Puiss_bruit = Puiss_sign * Ns  / (2 * log2(4) * 10 ^ (i / 10));
    Bruit_gauss = sqrt(Puiss_bruit) * N;
    y = x + Bruit_gauss;

    % Génération de la réponse impulsionnelle du filtre de réception
    h_r = h;

    % Filtrage de réception
    z = filter(h_r, 1, y);

    % Echantillonnage du signal
    z_echant = z(Ns : Ns : end);

    % Detecteur à seuil
    symboles_decides = zeros(1, length(z_echant));

    for j = 1 : length(z_echant)
        if (z_echant(j) > 2 * Ns)
            symboles_decides(j) = 3;
        elseif (z_echant(j) >= 0)
            symboles_decides(j) = 1;
        elseif (z_echant(j) < - 2 * Ns)
            symboles_decides(j) = -3;
        else
            symboles_decides(j) = -1;
        end
    end

    % Calcul du TES et du TEB
    TES(i + 1) = length(find(Symboles ~= symboles_decides)) / length(Symboles);       
    TEB(i + 1) = TES(i + 1) / 2;
end

% Tracé du TES en fonction de Eb/N0
figure;
semilogy([0 : 6], TES, 'r-*');
grid;
title("Figure 6 : TES en fonction de $\frac{Eb}{N_{o}}$", 'Interpreter', 'latex');
xlabel("$\frac{Eb}{N_{o}}$ (dB)", 'Interpreter', 'latex');
ylabel('TES');

%%
% Comparaison entre le TES théorique et le TES simulé
figure;
semilogy([0 : 6], TES, 'r*');
hold on
semilogy([0 : 6], (3 / 2) * qfunc(sqrt((4 / 5) * 10 .^ ([0 : 6] / 10))));
grid
title('Figure 7 : Comparaison entre le TES théorique et estimé');
legend('TES estimé','TES théorique')
xlabel("$\frac{Eb}{N_{o}}$ (dB)", 'Interpreter', 'latex');
ylabel('TES');

%%
% le taux d’erreur binaire (TEB) obtenu en fonction Eb/N0
figure;
semilogy([0 : 6], TEB, 'r*');
hold on
semilogy([0 : 6], ((3 / 2) * qfunc(sqrt((4 / 5) * 10 .^ ([0 : 6] / 10)))) / 2);
grid
title('Figure 8 : Comparaison entre le TEB théorique et estimé');
legend('TEB estimé','TEB théorique')
xlabel("$\frac{Eb}{N_{o}}$ (dB)", 'Interpreter', 'latex');
ylabel('TEB');

%%
% Comparaison entre le TEB de la chaine de réference et la  chaine courante
figure;
semilogy([0 : 6], qfunc(sqrt((2 * 10 .^ ([0 : 6] / 10)))), 'r');
hold on
semilogy([0 : 6], ((3 / 4) * qfunc(sqrt((4 / 5) * 10 .^ ([0 : 6] / 10)))));
grid
title('Figure 9 : Comparaison entre le TEB de la chaine de réference et de la quatrième chaine');
legend('TEB de la chaine de réference', 'TEB de la quatrième chaine')
xlabel("$\frac{Eb}{N_{o}}$ (dB)", 'Interpreter', 'latex');
ylabel('TEB');