% Initialisation de Matlab
clear;
close all;
clc;

% Télechargement des deux fichiers contenant les deux messages
load donnees1.mat
load donnees2.mat

% Paramètres
fp1 = 0;
fp2 = 46000;
T = 40 * 10 ^ -3;
Fe = 128000;
Te = 1 / Fe;
Ns = Fe * (T / length(bits_utilisateur1));
Ts = Ns * Te;

% Génération du m1(t) et m2(t)
m1 = kron(2 * bits_utilisateur1 - 1, ones(1, Ns));
m2 = kron(2 * bits_utilisateur2 - 1, ones(1, Ns));

% Traçage des deux messages m1 et m2
figure;
plot((0 : Te : (length(m1) - 1) * Te), m1)
ylim([-2,2])
title('figure1 : signal m1(t)')
xlabel('Temps en secondes')
ylabel('Amplitude de m1(t)')

figure;
plot((0 : Te : (length(m2) - 1) * Te), m2)
ylim([-2,2])
title('figure2 : signal m2(t)')
xlabel('Temps en secondes')
ylabel('Amplitude de m2(t)')

% Les densités spectrales de puissance des signaux m1(t) et m2(t)
S1 = (1 / Ns) * abs(fft(m1)) .^ 2;
S2 = (1 / Ns) * abs(fft(m2)) .^ 2;

% Traçage des densités spectrales de puissance des signaux m1(t) et m2(t)
figure;
plot((0 : Te : (length(fft(m1)) - 1) * Te), S1)
title('figure3 : densité spectrale de puissance du signal m1(t)')
xlabel('Fréquence en Hz')
ylabel('densité spectrale de puissance du signal m1(t)')

figure;
plot((0 : Te : (length(fft(m2)) - 1) * Te), S2)
title('figure4 : densité spectrale de puissance du signal m2(t)')
xlabel('Fréquence en Hz')
ylabel('densité spectrale de puissance du signal m2(t)')

% Construction du signal MF-TDMA
sign1 = [zeros(1, length(m1)), m1, zeros(1, 3 * length(m1))];
sign2 = [zeros(1, 4 * length(m2)), m2];
signal = [zeros(1, length(m1)), m1, zeros(1, 2 * length(m1)), m2];

% Tracé du signal résultant avec une échelle temporelle en secondes.
figure;
plot((0 : Te : (length(signal) - 1) * Te), signal)
title('figure5 : Signal résultant ');
xlabel('temps en (s)');
ylabel('signal résultant');

% Construction des signaux x1(t) et x2(t)
fp1 = 0;
fp2 = 46000;
phi = rand * 2 * pi;
x1 = sign1;
x2 = sign2 .* cos (2 * pi * fp2 * (0 : Te : (length(signal) - 1) * Te) + phi);

% Construction du signal MF-TDMA
x = x1 + x2;
N = randn(1, length(signal));
SNR = 100;
Puiss_sign = mean(x .^ 2);
Puiss_bruit = Puiss_sign * 10 ^ (-SNR / 10);
Bruit_gauss = sqrt(Puiss_bruit) * N;
sign_MF_TDMA = signal + Bruit_gauss;

% Tracé le signal MF-TDMA avec une sudo /usr/local/MATLAB/R2018b/bin/matlabéchelle temporelle en secondes
figure;
plot((0 : Te : (length(signal) - 1) * Te), sign_MF_TDMA);
title('figure6 : Signal MF-TDMA avec une échelle temporelle');
xlabel('temps en (s)');
ylabel('signal MF-TDMA');

% La densité spectrale de puissance du signal MF-TDMA
S_MF_TDMA = (1 / Ns^2) * abs(fft(sign_MF_TDMA)) .^ 2;

% Traçage des densités spectrales de puissance du signal MF-TDMA
figure;
plot((-Fe : 2 * Fe / (length(fft(sign_MF_TDMA)) - 1) : Fe), fftshift(S_MF_TDMA))
title('figure7 : densité spectrale de puissance du signal MF-TDMA');
xlabel('Fréquence en Hz');
ylabel('densité spectrale de puissance du signal MF-TDMA');

% Filtre passe-bas de type RIF permettant de récupérer le signal x1(t)

% Calcule et tracé d'un morceau de la réponse impulsionnelle
N = length(sign1);
k = [-N/2 : N/2-1] * Te;
rb = 2 / (Ns * N) * 2 * fp2 * sinc(2 * fp2 * k);
figure;
plot(k, rb);
title("figure 8 : Morceau de la réponse impulsionnelle idéale");
xlabel("Temps en seconds");
ylabel("Morceau de la réponse impulsionnelle idéale");

% La TF de la réponse impulsionnelle
f = [-N/2 : N/2-1]*Fe/(2*N);
Rb = fft(rb);
figure;
plot(f, (abs(fftshift(Rb))));
title("Figure 9 : TF de la réponse impulsionnelle idéale");
xlabel("Fréquence en Hz");
ylabel("TF de la réponse impulsionnelle idéale");

% Traçage de la DSP de MF-TDMA et du module de la réponse en fréquences du filtre implanté
figure;
plot((-Fe/2 : Fe / length(sign1) : Fe/2 - 1), (abs(fftshift(fft(sign_MF_TDMA)) .* fftshift(Rb))));
title("Figure 10 :DSP de MF-TDMA et le module de la réponse en fréquences du filtre implanté");
xlabel("Fréquence en Hz");
ylabel("Amplitude en V");
hold on;
plot((-Fe : 2 * Fe / (length(fft(sign_MF_TDMA)) - 1) : Fe), fftshift(S_MF_TDMA))
hold off;
legend('DSP de MF-TDMA', 'module de la réponse en fréquences du filtre implanté')

% Filtre passe-haut de type RIF permettant de récupérer le signal x2(t)

% Calcule et tracé d'un morceau de la réponse impulsionnelle
Dir = dirac(k*Te);
idx = Dir == Inf;
Dir(idx) = 1;
rh = Dir - rb;
figure();
plot(k, rh);
title("figure 11 : Morceau de la réponse impulsionnelle idéale");
xlabel("Temps en seconds");
ylabel("Morceau de la réponse impulsionnelle idéale");

% La TF de la réponse impulsionnelle
Rh = fft(rh);
figure;
plot(f, (abs(fftshift(Rh))));
title("Figure 12 : TF de la réponse impulsionnelle idéale");
xlabel("Fréquence en Hz");
ylabel("TF de la réponse impulsionnelle idéale");

% Traçage de la DSP de MF-TDMA et du module de la réponse en fréquences du filtre implanté
figure;
plot((-Fe/2 : Fe / length(sign1) : Fe/2 - 1), (abs(fftshift(fft(sign_MF_TDMA)) .* fftshift(Rh))));
title("Figure 13 :DSP de MF-TDMA et le module de la réponse en fréquences du filtre implanté");
xlabel("Fréquence en Hz");
ylabel("Amplitude en V");
hold on;
plot((-Fe : 2 * Fe / (length(fft(sign_MF_TDMA)) - 1) : Fe), fftshift(S_MF_TDMA))
hold off;
legend('DSP de MF-TDMA', 'module de la réponse en fréquences du filtre implanté')

% Procéder aux filtrages du signal MF-TDMA 

% Retrouver les deux signaux
msg1 = conv(sign_MF_TDMA, rb, 'same');
msg2 = conv(sign_MF_TDMA, rh, 'same');

% Tracé des deux signaux
figure;
plot(linspace(-1 / fp2, 1 / fp2, length(msg1)), msg1);
title("Figure 14 : Le filtrage du message 1 et 2");
xlabel("temps en s");
ylabel("x(t)");
hold on;
plot(linspace(-1 / fp2, 1 / fp2, length(msg2)), msg2);
hold off;
legend('x1(t)', 'x2(t)');

% Retour en bande de base

% Implantation de l'opération de retour en bande de base
m_2 =  msg2 .* cos(2 * pi * fp2 *  linspace(-1 / fp2, 1 / fp2, length(msg2)));
m_1_filtre = conv(msg1, rb, 'same');
m_2_filtre = conv(m_2, rh,'same');

% Tracé
figure;
plot(linspace(-1 / fp2, 1 / fp2, length(m_1_filtre)), m_1_filtre);
title("Figure 15 : Le filtrage du message 1 et 2");
xlabel("temps en s");
ylabel("x(t)");
hold on;
plot(linspace(-1 / fp2, 1 / fp2, length(m_1_filtre)), m_2_filtre);
hold off;
legend("x1(t)","x2(t)");

% Detection du slot utile

trame_apres_retour_bande = m_1_filtre + m_2_filtre;
tranche_1 = trame_apres_retour_bande(1 : length(m1));
tranche_2 = trame_apres_retour_bande(length(m1) + 1 : 2 * length(m1));
tranche_3 = trame_apres_retour_bande(2 * length(m1) + 1 : 3 * length(m1));
tranche_4 = trame_apres_retour_bande(3 * length(m1) + 1 : 4 * length(m1));
tranche_5 = trame_apres_retour_bande(4 * length(m1) + 1 : end);
solt_utile = zeros(1,length(trame_apres_retour_bande));
energie_1 = mean(abs(tranche_1).^2)*length(tranche_1);
energie_2 = mean(abs(tranche_2).^2)*length(tranche_2);
energie_3 = mean(abs(tranche_3).^2)*length(tranche_3);
energie_4 = mean(abs(tranche_4).^2)*length(tranche_4);
energie_5 = mean(abs(tranche_5).^2)*length(tranche_5);

% Démodulation bade de base
SignalFiltre = conv(tranche_2, ones(1, Ns), 'same');
SignalEchantillonne = SignalFiltre(1 : Ns : end);
BitsRecuperes = (sign(SignalEchantillonne) + 1) / 2;

text1 = bin2str(BitsRecuperes)

SignalFiltre = conv(tranche_5, ones(1, Ns), 'same');
SignalEchantillonne = SignalFiltre(1 : Ns : end);
BitsRecuperes = (sign(SignalEchantillonne) + 1) / 2;

text2 = bin2str(BitsRecuperes)