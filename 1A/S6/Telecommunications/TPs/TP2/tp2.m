%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Télécommunications
% TP2 - Etudes de chaines de transmission sur fréquence porteuse
% passe_bas.m
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Initialisation
%--------------------------------------------------------------------------
clear;
close all;
clc;

%%
%--------------------------------------------------------------------------
% Utilisation de la chaine passe-bas équivalente pour le calcul et
% l’estimation du taux d’erreur binaire
%--------------------------------------------------------------------------

% Initialisation des paramètres
Fe = 10000;
Te = 1 / Fe;
alpha = 0.35;
span = 8;
fp = 2000;
Rs = 1000;
nb_bits = 10;
Ns = Fe / Rs;

%%
%--------------------------------------------------------------------------
% Implantation de la chaine sans bruit
%--------------------------------------------------------------------------
% Génération de l’information binaire
bits = randi([0, 1], 1, nb_bits);

% Mapping permettant d'obtenir dk ∈ {±1 ± j}
ak = 2 * bits(1 : 2 : end) - 1;
bk = 2 * bits(2 : 2 : end) - 1;
dk = ak + 1j * bk;

% Génération de la suite de Diracs pondérés par les symbols (suréchantillonnage)
Suite_diracs1 = kron(ak, [1 zeros(1, Ns - 1)]);
Suite_diracs2 = kron(bk, [1 zeros(1, Ns - 1)]);

% Génération de la réponse impulsionnelle du filtre de mise en forme
h = rcosdesign(alpha, 8, Ns, 'sqrt');
retard = (span * Ns) / 2;

% Filtrage de mise en forme du signal généré sur la voie I
I = filter(h, 1, [Suite_diracs1 zeros(1, retard)]);
I = I(retard + 1 : end);

% Filtrage de mise en forme du signal généré sur la voie Q
Q = filter(h, 1, [Suite_diracs2 zeros(1, retard)]);
Q = Q(retard + 1 : end);

% Le signal transmis sur fréquence porteuse
T = [0 : length(I) - 1] * Te;
x =  I .* cos(2 * pi * fp * T) - Q .* sin(2 * pi * fp * T);

% Affichage du signal génerée sur la voie en phase
figure ;
plot(I);
axis([0 length(I) - 1 -1 1]);
title('Signal généré sur la voie en phase I');
xlabel('Temps en secondes');
ylabel('I(t)');

% Affichage du signal généré sur la voie en quadrature
figure ;
plot(Q);
axis([0 length(Q) - 1 -1 1]);
title('Signal généré sur la voie en quadrature Q');
xlabel('Temps en secondes');
ylabel('Q(t)');

% Affichage du signal reçu
figure ;
plot(x);
axis([0 nb_bits - 1 -1 1]);
title('Signal émis x sans bruit');
xlabel('Temps en secondes');
ylabel('Signal émis x');

%%
% Calcul de la DSP du signal par périodogramme
DSP_x = (1 / length(x)) * abs(fft(x, 2 ^ nextpow2(length(x)))) .^ 2;

% Affichage de la DSP du signal émis
figure;
plot(linspace(-Fe / 2, Fe / 2, length(DSP_x)), fftshift(DSP_x));
title('DSP du signal émis de la chaine sur fréquence porteuse');
xlabel('Fréquences en Hz');
ylabel('S_{x}(f)');

%%
% Le diagramme de l’oeil en sortie du filtre de mise en forme
diagramme_oeil = reshape(x, Ns, length(x) / Ns);
figure;
plot(diagramme_oeil);
title("Diagramme de l'oeil sans bruit en sortie du filtre de mise en forme");
xlabel('Temps en secondes');

%%
% Retour en bande de base
x = x .* cos(2 * pi * fp * T);

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
title("Diagramme de l'oeil sans bruit du signal reçu");
xlabel('Temps en secondes');

% Echantillonnage du signal
z_echant = z(1 : Ns : end);

% Detecteur à seuil
symboles_decides = zeros(1,length(z_echant));
for i = 1 : length(z_echant)
    if (I(i) <= 0 & Q(i) <= 0)
        symboles_decides(i) = -1 - 1i;
    elseif (I(i) >= 0 & Q(i) >= 0)
        symboles_decides(i) = 1 + 1i;
    elseif (I(i) <= 0 & Q(i) >= 0)
        symboles_decides(i) = -1 + 1i;
    elseif (I(i) >= 0 & Q(i) <= 0)
        symboles_decides(i) = 1 - 1i;
    end
end


% Calcul du TEB
bits_erron = 0;
for i = 1 : 5
    if (bits(i) ~= symboles_decides(i))
        bits_erron = bits_erron + 1;
    end
end
TEB = bits_erron/length(bits)