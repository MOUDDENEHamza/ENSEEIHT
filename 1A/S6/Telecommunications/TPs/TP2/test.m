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
M = 8;

nb_bits = 10000;


%% Implantation de la chaine passe-bas equivalente

% Generation des bits à transmettre
Bits = randi([0 M-1],1,nb_bits);

% Mapping de Gray
dk = pskmod(Bits,M,pi/M);

% Tracé des constellations
scatterplot(dk,1,0,'rd')
grid on;


% Suréchantillonage : génération de la sutite de diracs
Suite_diracs_1 = kron(dk,[1, zeros(1,Ns-1)]);


% Reponse impulsionnelle du filtre de mise en forme
h_1 = rcosdesign(roll_of,6,Ns,'sqrt');
retard = (length(h_1) - 1)/2;

% Filtrage de mise en forme
x_1 = filter(h_1,1,[Suite_diracs_1,zeros(1,retard)]);
% 

% Filtre de reception
h_r_1 = h_1;   % filtrage adapté

% Filtrage de reception
z_1 = filter(h_r_1,1,[x_1,zeros(1,retard)]);
z_1 = z_1(1,2*retard+1:end);

% Diagramme de l'oeil
n = size(z_1,2)/(2*Ns);
z_til_arg = angle(z_1);
z_til_arg = reshape((z_til_arg),2*Ns,n);


% Trace du diagramme
figure;
t2 = linspace(0,2*Ts,size(z_til_arg,1));
plot(t2,z_til_arg)
xlabel('Periode Ts')
title("Diagramme de l'oeil de la chaine 8-PSK")

% figure;
% t2 = linspace(0,2*Ts,size(z_til_im,1));
% plot(t2,z_til_im)
% xlabel('Periode Ts')
% title("Diagramme de l'oeil de la chaine Q QPSK")

% Echantillonnage
% Pour l'echantillonage on choisit t0 = Ts
% Car l'oeil est ouvert pour t = Ts
t0 = 1;
%arg_z = angle(z_1);
dec_arg = z_1(t0:Ns:end);
%dec_im = im_z(t0:Ns:end);

% Prise de decisions
%n = size(dec_real,2);

% bits_real = (dec_real > 0);
% bits_im = (dec_im > 0);
bits_recup = pskdemod(dec_arg,M,pi/M);
% for i = 1 : n
%     bits_recup(2*i -1) = bits_real(i);
%     bits_recup(2*i) = bits_im(i);
% end

% Calcul du TEB
bits_erron = 0;
for i = 1 : length(Bits)
    if (Bits(i) ~= bits_recup(i))
        bits_erron = bits_erron + 1;
    end
end
TEB = bits_erron/length(Bits)

% Calcul de la puissance du signal



% Simulation du taux d'erreur binaire
% Calcul de la puissance
Pre = mean(abs(x_1(1,retard+1:end)).^2);
%disp('La puissance du signal modulé sur fréquence porteuse est :'); Pr
TEB_bruit = zeros(1,7);
for i = 0 : 6
    Eb_No = 10^(i/10);
    sigma_real = sqrt(Ns*Pre/(2*log2(M)*Eb_No));
    sigma_im = sqrt(Ns*Pre/(2*log2(M)*Eb_No));
    
    TEB_Theo(i+1) = 2* qfunc(sqrt(log2(M)*2*Eb_No)*sin(pi/M));
    % Rajout du bruit
    N_I = sigma_real*randn(1,(nb_bits*Ns) +retard);
    N_Q = sigma_im*randn(1,(nb_bits*Ns) +retard);
    
    Ne = N_I + 1j*N_Q;
    
    x_1_i = x_1 + Ne;
    
    
    % Filtrage de reception avec le bruit
    z_x_i = filter(h_r_1,1,[x_1_i,zeros(1,retard)]);
    z_1_i = z_x_i(1,2*retard+1 : end);
    
    % Echantillonnage
    % Pour l'echantillonage on choisit t0 = Ts
    % Car l'oeil est ouvert pour t = Ts
    t0 = 1;
    dec_arg = z_1_i(t0:Ns:end);
     
    
    % Prise de decisions
    %n = size(dec_real,2);
%     bits_real = (dec_real > 0);
%     bits_im = (dec_im > 0);
     bits_recup_i = pskdemod(dec_arg,M,pi/M);
%     for k = 1 : n
%         bits_recup_i(2*k -1) = bits_real(k);
%         bits_recup_i(2*k) = bits_im(k);
%     end
    
    % Calcul du TEB
    bits_erron_i = 0;
    for j = 1 : length(Bits)
        if (Bits(j) ~= bits_recup_i(j))
            bits_erron_i = bits_erron_i + 1;
        end
    end
    
    TEB_bruit(i+1) = bits_erron_i/nb_bits;
    
    % Tracé des constellations
    
    
    
    dec_real = real(dec_arg);
    dec_im = imag(dec_arg);
    figure(21)
    subplot(3,4,i+1)
    plot(dec_real,dec_im, 'r.')
    hold on
    plot(real(dk),imag(dk), 'b*')
    hold on, plot([-4 4],[0 0],'k-')
    hold on, plot([0 0], [-4 4], 'k-')
    xlabel('I')
    ylabel('Q')
    title(["Constellations pour Eb/No = ",i,"Db"])
    
end

% Tracé du taux d'erreur binaire en fonction de Eb/No
figure;
semilogy(TEB_bruit,'o--')
grid on;
xlabel("Rapport Eb/No")
ylabel("TEB")
title("TEB en fonction de Eb/No")

% Calcul du TEB theorique
figure;
semilogy(TEB_bruit,'g')
hold on;
semilogy(TEB_Theo,'r')
grid on;
legend('TEB pratique', 'TEB theorique')
xlabel('Eb/N0')
ylabel('Valeur du TEB')
title('Comparaison des TEB')





