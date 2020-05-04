clear all;
close all;
clc;

roll_of = 0.35;
fp = 2000;
Rs = 1000;
Fe = 10000;
Te = 1/Fe;
Ns = 10;
Ts = 1/Rs;
Fc1 = fp/Fe;
Nech = 30;
M = 4;

nb_bits = 10000;

%% Implantation de la transmission sur porteuse 

% Generation des bits à transmettre
Bits = randi([0,1],1,nb_bits);

% Mapping de Gray
ak = zeros(1,length(Bits)/2);
bk = zeros(1,length(Bits)/2);
dk = zeros(1,length(Bits)/2);
for i=1 :2: size(Bits,2)
 if Bits(i) == 0
     ak((i+1)/2) = -1;
 else
      ak((i+1)/2) = 1;
 end
 if Bits(i+1) == 0
     bk((i+1)/2) = -1;
 else
      bk((i+1)/2) = 1;
 end
    dk((i+1)/2) = ak((i+1)/2) + 1j*bk((i+1)/2);
end

% Suréchantillonage : génération de la sutite de diracs
Suite_diracs_1 = kron(dk,[1, zeros(1,Ns-1)]);
   

% Reponse impulsionnelle du filtre de mise en forme
 h_1 = rcosdesign(roll_of,6,Ns,'sqrt');
 retard = (length(h_1) - 1)/2;
  
% Filtrage de mise en forme
x_1 = filter(h_1,1,[Suite_diracs_1,zeros(1,retard)]);

% Tracé des signaux générés sur les voies
figure;
subplot(221)
plot(real(x_1), 'r')
xlabel('t')
ylabel('I(t)')
title('Signal généré sur la voie I')
 

subplot(222)
plot(imag(x_1),'b')
xlabel('t')
ylabel('Q(t)')
title('Signal généré sur la voie Q')
 

% Transposition en frequence
t = (0:length(x_1)-1)/Fe;
x_1_t = x_1.*exp(2j*pi*fp.*t);
x_1_t = real(x_1_t);

% Tracé du signal transmis sur la porteuse
figure;
plot(x_1_t)
xlabel('t')
title('Signal transmis sur la porteuse')

% Calcul et tracé de la DSP par la methode du périodogramme
figure;
dsp = (abs(fft(x_1_t)).^2)/length(x_1_t);
tx = linspace(-Fe/2,Fe/2,length(dsp));
plot(tx,fftshift(dsp),'r')
xlabel('f en Hz')
ylabel('DSP')
title('Tracé de la DSP du signal modulé sur porteuse')
    
    


% Retour en bande de base
ak_1 = x_1_t .* cos(2*pi*fp.*t);
bk_1 = x_1_t .* sin(2*pi*fp.*t);

%Filtrage passe-bas
%Reponse impulsionnelle
t1 = [-Nech:Nech];
b = 2*Fc1*sinc(2*Fc1*t1);
ak_1 = filter(b,1,[ak_1 zeros(1,Nech)]);
bk_1 = filter(b,1,[bk_1 zeros(1,Nech)]);

dk_1 = ak_1 - 1j*bk_1;

% Filtre de reception
h_r_1 = h_1;   % filtrage adapté

% Filtrage de reception
z_1 = filter(h_r_1,1,[dk_1,zeros(1,retard)]);
z_1 = z_1(1,(2*retard)+Nech +1:end);

figure ;
plot(real(z_1));
axis([0 nb_bits - 1 -1.5 1.5]);
title('Figure 1 : signal reçu z sans bruit');
xlabel('Temps en secondes');
ylabel('Signal reçu z');
% Diagramme de l'oeil
n = size(z_1,2)/(2*Ns);
z_til_real = real(z_1);
z_til_im = imag(z_1);
z_til_real = reshape((z_til_real),2*Ns,n);
z_til_im = reshape((z_til_im),2*Ns,n);
  
% Trace du diagramme
figure;
t2 = linspace(0,2*Ts,size(z_til_real,1));
plot(t2,z_til_real)
xlabel('Periode Ts')
title("Diagramme de l'oeil de la chaine Q QPSK")

figure;
t2 = linspace(0,2*Ts,size(z_til_im,1));
plot(t2,z_til_im)
xlabel('Periode Ts')
title("Diagramme de l'oeil de la chaine I QPSK")

% Echantillonnage
% Pour l'echantillonage on choisit t0 = Ts
% Car l'oeil est ouvert pour t = Ts
t0 = 1;
im_z = imag(z_1);
real_z = real(z_1);
dec_real = real_z(t0:Ns:end);
dec_im = im_z(t0:Ns:end);

% Prise de decisions
n = size(dec_real,2);
bits_real = (dec_real > 0);
bits_im = (dec_im > 0);
bits_recup = zeros(1,2*n);
for i = 1 : n
    bits_recup(2*i -1) = bits_real(i);
    bits_recup(2*i) = bits_im(i);
end

% Calcul du TEB
bits_erron = 0;
for i = 1 : length(Bits)
    if (Bits(i) ~= bits_recup(i))
        bits_erron = bits_erron + 1;
    end
end
TEB = bits_erron/length(Bits)

% Simulation du taux d'erreur binaire
% Calcul de la puissance
Pr = mean(abs(x_1_t).^2);
disp('La puissance du signal modulé sur fréquence porteuse est :'); Pr
TEB_bruit = zeros(1,7);
for i = 0 : 6
    Eb_No = 10^(i/10);
    sigma = sqrt(Pr*Ns /(2*log2(M)*Eb_No));
    
    TEB_Theo(i+1) = (4*(1-(1/sqrt(M)))* qfunc(sqrt(3*log2(M)*Eb_No/(M-1))))/log2(M);
    % Rajout du bruit
    x_1_i = x_1_t + (sigma*randn(1,(nb_bits*Ns/2) +retard));
    
    
    % Retour en bande de base
    ak_1 = x_1_i .* cos(2*pi*fp.*t);
    bk_1 = x_1_i .* sin(2*pi*fp.*t);
    
    %Filtrage passe-bas
    %Reponse impulsionnelle
    t1 = [-Nech:Nech];
    b = 2*Fc1*sinc(2*Fc1*t1);
    ak_1 = filter(b,1,[ak_1 zeros(1,Nech)]);
    bk_1 = filter(b,1,[bk_1 zeros(1,Nech)]);
    
    dk_i = ak_1 - 1j*bk_1;
    
    
    % Filtrage de reception avec le bruit
    z_x_i = filter(h_r_1,1,[dk_i,zeros(1,retard)]);
    z_1_i = z_x_i(1,2*retard + Nech +1 : end);
    
    % Echantillonnage
    % Pour l'echantillonage on choisit t0 = Ts
    % Car l'oeil est ouvert pour t = Ts
    t0 = 1;
    im_z = imag(z_1_i);
    real_z = real(z_1_i);
    dec_real = real_z(t0:Ns:end);
    dec_im = im_z(t0:Ns:end);
    
    % Prise de decisions
    n = size(dec_real,2);
    bits_real = (dec_real > 0);
    bits_im = (dec_im > 0);
    bits_recup_i = zeros(1,2*n);
    for k = 1 : n
        bits_recup_i(2*k -1) = bits_real(k);
        bits_recup_i(2*k) = bits_im(k);
    end
    
    % Calcul du TEB
    bits_erron_i = 0;
    for j = 1 : length(Bits)
        if (Bits(j) ~= bits_recup_i(j))
            bits_erron_i = bits_erron_i + 1;
        end
    end
    
    TEB_bruit(i+1) = bits_erron_i/nb_bits;
end

% Tracé du taux d'erreur binaire en fonction de Eb/No
figure;
semilogy(TEB_bruit,'o--')
xlabel("Rapport Eb/No")
ylabel("TEB")
title("TEB en fonction de Eb/No")

% Calcul du TEB theorique
figure;
semilogy(TEB_bruit,'g')
hold on;
semilogy(TEB_Theo,'r')
legend('TEB pratique', 'TEB theorique')
xlabel('Eb/N0')
ylabel('Valeur du TEB')
title('Comparaison des TEB')


%% Implantation de la chaine passe-bas equivalente

