%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Télécommunications
% TP2 - Etudes de chaines de transmission sur fréquence porteuse
% chaine_4ASK.m
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
alpha = 0.5;
span = 8;
fp = 2000;
fc = 1500;
Rs = 3000;
nb_bits = 10000;
Ns = floor(Fe / Rs);
N = 50;

%%
%--------------------------------------------------------------------------
% Implantation de la chaine sans bruit
%--------------------------------------------------------------------------
% Génération de l’information binaire
bits = randi([0, 1], 1, nb_bits);

% Mapping de Gray
Symboles = (2 * bi2de(reshape(bits, 2, length(bits)/2).') - 3).';

% Génération de la suite de Diracs pondérés par les symbols
Suite_diracs = kron(Symboles, [1 zeros(1, Ns - 1)]);

% Génération de la réponse impulsionnelle du filtre de mise en forme
h = rcosdesign(alpha, span, Ns, 'sqrt');
retard = (span * Ns) / 2;

% Filtrage de mise en forme du signal génére
x = filter(h, 1, [Suite_diracs zeros(1, retard)]);
x = x(retard + 1 : end);

% Affichage du signal transmis après le filtrage de mise en forme
figure;
plot(x);
axis([0 length(x) - 1 -3 3]);
title('Signal transmis après le filtrage de mise en forme');
xlabel('Temps en secondes');
ylabel('x(t)');

%%
% Calcul de la DSP  du signal transmis par périodogramme
DSP_x = (1 / length(x)) * abs(fft(x, 2 ^ nextpow2(length(x)))) .^ 2;

% Affichage du signal transmis par périodogramme
figure;
plot(linspace(-Fe / 2, Fe / 2, length(DSP_x)), fftshift(DSP_x));
title('DSP du signal transmis');
xlabel('Fréquences en Hz');
ylabel('S_{x_{e}}(f)');

%%
% Génération de la réponse impulsionnelle du filtre de réception
h_r = h;

% Filtrage de réception
z = filter(h_r, 1, [x zeros(1,retard)]);
z = z(retard + 1 : end);

% Affichage du signal reçu
figure ;
plot(z);
axis([0 nb_bits - 1 -3 3]);
title('Signal reçu z sans bruit');
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
symboles_decides = zeros(1, length(z_echant));

for i = 1 : length(z_echant)
    if (z_echant(i) > 2)
        symboles_decides(i) = 3;
    elseif (z_echant(i) >= 0)
        symboles_decides(i) = 1;
    elseif (z_echant(i) < -2)
        symboles_decides(i) = -3;
    else
        symboles_decides(i) = -1;
    end
end

% Calcul TES
TES = length(find(Symboles ~= symboles_decides)) / length(Symboles);

% Taux d'erreurs binaires
TEB = TES / 2

%%
%--------------------------------------------------------------------------
% Implantation de la chaine avec bruit
%--------------------------------------------------------------------------
TES = zeros(1,7);
TEB = zeros(1,7);

for i = 0 : 6
    % L'ajout du bruit blanc gaussien
    Puiss_sign = mean(abs(x) .^ 2);
    Puiss_bruit = Puiss_sign * Ns  / (2 * log2(4) * 10 .^ (i / 10));
    Bruit_gauss = (sqrt(Puiss_bruit) * randn(1, length(x))) + 1i * (sqrt(Puiss_bruit) * randn(1, length(x)));
    y = x + Bruit_gauss; 
    
    % Filtrage de réception
    z = filter(h_r, 1, [y zeros(1,retard)]);
    z = z(retard + 1 : end);
    
    % Echantillonnage du signal
    z_echant = z(1 : Ns : end);% Retour en bande de base
    
    % Les constellations en sortie du mapping et de l’échantillonneur
    figure;
    plot(real(z_echant), 0, 'r*');
    xlim([-4 4])
    hold on;
    plot(Symboles, 0, 'b*');
    legend('Les constellations en sortie du mapping','Les constellations en sortie de l’échantillonneur')
    xlabel('I');
    ylabel('Q');
    
    % Detecteur à seuil
    symboles_decides = zeros(1, length(z_echant));
    
    for j = 1 : length(z_echant)
        if (real(z_echant(j)) > 2)
            symboles_decides(j) = 3;
        elseif (real(z_echant(j)) >= 0)
            symboles_decides(j) = 1;
        elseif (real(z_echant(j)) < -2)
            symboles_decides(j) = -3;
        else
            symboles_decides(j) = -1;
        end
    end
    
    % Calcul TES
    TES(i + 1) = length(find(Symboles ~= symboles_decides)) / length(Symboles);
    
    % Taux d'erreurs binaires
    TEB(i + 1) = TES(i + 1) / 2;
end

%%
% Comparaison entre le taux d’erreur binaire (TEB) obtenu en fonction Eb/N0
% et le TEB théorique
figure;
semilogy([0 : 6], TEB, 'r*');
hold on
semilogy([0 : 6], (3 / 4) * qfunc(sqrt((4 / 5) * 10 .^ ([0 : 6] / 10))));
grid
title('Comparaison entre le TEB théorique et estimé');
legend('TEB estimé','TEB théorique')
xlabel("$\frac{Eb}{N_{o}}$ (dB)", 'Interpreter', 'latex');
ylabel('TEB');