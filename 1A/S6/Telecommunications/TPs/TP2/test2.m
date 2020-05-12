clc;
close all;
%%
%fréquence d'échantillonnage en Hz
Fe=10000;
%paramètre de cosinus suréelvé
span=50;
%temps d'échantillonnage
Te = 1/Fe;
%nb_bits
nb_bits=10000;    
%fréquence porteuse
fp = 2000;
%Nombre de symbole
M = 8;
%Génération de l'information binaire
bits=randi([0,M-1],1,nb_bits);  
%nombre de bits par symbole
n=log2(M);
% conversion des valeurs décimales en symboles complexes 8-PSK
symboles=pskmod(bits,M,pi/M);
symboles_ak = real(symboles);
symboles_bk = imag(symboles);
%débit symbole
Rs=2000; 
%roll off
alpha = 0.5;
%Durée symbole en nombre d’échantillons : Ns=Ts*Fe et Ns_min = 1+alpha
Ns_1=floor(Fe/Rs);
%Génération de la suite de Diracs pondérés par les symbols ( suréchantillonnage)
Suite_diracs_a=kron(symboles_ak, [1 zeros(1,Ns_1-1)]); 
Suite_diracs_b=kron(symboles_bk, [1 zeros(1,Ns_1-1)]); 
%Génération de la réponse impulsionnelle du filtre de mise en forme(SRRCF) 
h = rcosdesign(alpha/2,span,Ns_1);
hr=h;
I = filter(h,1,[Suite_diracs_a zeros(1,(span*Ns_1)/2)]);
I = I(((span*Ns_1)/2)+1:end);

Q = filter(h,1,[Suite_diracs_b zeros(1,(span*Ns_1)/2)]);
Q = Q(((span*Ns_1)/2)+1:end);

T = 0:Te:(length(I)-1)*Te;
signal_transmis = I.*cos(2*pi*fp*T) - Q.*sin(2*pi*fp*T);

%filtrage
signal_I = signal_transmis.*cos(2*pi*fp*T);
signal_Q = -1i*signal_transmis.*sin(2*pi*fp*T);
signal_1 = signal_I+signal_Q;

%filtrage
signal_conv  = filter(hr,1,[signal_1 zeros(1,(span*Ns_1)/2)]);

signal_PSK = signal_conv(((span*Ns_1)/2)+1:end);

signal_echantillonne_BdB = signal_PSK(1:Ns_1:end);

bits_decides_BdB=pskdemod(signal_echantillonne_BdB,M,pi/M);
TEB=length(find(bits_decides_BdB ~= bits))/length(bits)

%%    
    Eb_N0=0.1;   
    Pr=mean(abs(signal_transmis).^2);
    %la puissance du bruit en sortie du filtre de réception
    sigma_n_carre=(Pr*Ns_1)/(2*n*Eb_N0);
    %Génération du bruit 
    bruit=sqrt(sigma_n_carre)*randn(1,length(signal_transmis));
    %signal généré avec bruit
    signal_bruite=signal_transmis+bruit;
    %filtrage
    signal_b_I = signal_bruite.*cos(2*pi*fp*T);
    signal_b_Q = -1i*signal_bruite.*sin(2*pi*fp*T);
    signal_b = signal_b_I+signal_b_Q;
    signal_conv  = filter(hr,1,[signal_b zeros(1,(span*Ns_1)/2)]);
    %échantillonnage du signal à T=Ns, le pas= Ns
    signal_PSK = signal_conv(((span*Ns_1)/2)+1:end);
    signal_echant_BdB = signal_PSK(1:Ns_1:end);
     figure;
    plot(real(signal_echant_BdB),imag(signal_echant_BdB),'r*');hold on;
    plot(symboles_ak,symboles_bk,'b*');
    title('Constellations pour Eb /N0= 0.1');