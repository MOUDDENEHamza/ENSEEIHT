% Initialisation de Matlab
clear;
close all;
clc;

%%Implantation du modulateur

%question1

f0 = 200;
Fe = 1000;
Te = 1/Fe;
Nb = 20;
Ns = 20;
Ts = Ns*Te;
N=Ns*Nb;
Ordre1 = 21;
Ordre2 = 61;
bits=randi([0,1],1,Nb);
m=kron(2*bits-1,ones(1,Ns));
t=linspace(0,(Ns-1)*Te,size(m,2));
figure;plot(t,m);
title('figure1');
M = fft(m);
figure;plot(abs(M));
title('figure2');

%Générationd'un cosinus numérique

x = cos(2*pi*f0*[0:Te:(N-1)*Te]);
y = m.*x;
Y = fftshift(fft(y));
figure();
plot([0 : 1/(N*Te) : (1/Te) - (1/Te)/N] , abs(Y)); %Tracé
title("figure 3");
xlabel("Fréquence (Hz)");
ylabel("Signal Modulé");

%Implantation du retour à basse fréquence

t = y.*x; %Multiplication par le cosinus
T=fftshift(fft(t));
figure();
plot([0:Fe/N:Fe-Fe/N],abs(T));
title("figure 4");
xlabel("Fréquence (Hz)");
ylabel("Signal");

%Calcule et tracé d'un morceau de la réponse impulsionnelle

r = 2*(2*f0)*sinc(2*[-N*Te:Te:N*Te]*pi*(2*f0));
figure();
plot([-N*Te:Te:N*Te],r);
title("figure 5");
xlabel("Temps (s)");
ylabel("Morceau de la réponse impulsionnelle idéale");

%La TF de la réponse impulsionnelle

R = fftshift(fft(r));
figure();m
plot(linspace(0,Fe,length(R)),abs(R));
title("Figure 6");
xlabel("Fréquence (Hz)");
ylabel("TF de la réponse impulsionnelle idéale");

%Comparaison des réponses impulsionnelles 

r1 = 2*(2*f0)*sinc(2*[-Ordre1*Te:Te:Ordre1*Te]*pi*(2*f0));
R1 = fftshift(fft(r1));

r2 = 2*(2*f0)*sinc(2*[-Ordre2*Te:Te:Ordre2*Te]*pi*(2*f0));
R2 = fftshift(fft(r2));

figure();
plot([-Ordre1*Te:Te:Ordre1*Te],r1)
hold on;
plot([-Ordre2*Te:Te:Ordre2*Te],r2);
title("Figure 7");
xlabel("Temps (s)");
ylabel("Morceau de la réponse impulsionnelle idéale");
legend("Ordre = 21 " , "Ordre = 61");

figure();
plot(linspace(0,Fe,length(R1)) , abs(R1)); hold on;
plot(linspace(0,Fe,length(R2)) , abs(R2));
title("figure 8");
xlabel("Fréquence (Hz)");
ylabel("TF de la réponse impulsionnelle idéale");
legend("Ordre = 21" , "Ordre = 61");

%Comparaison des réponses impulsionnelles pour deux fenêtres de troncatures
%différentes

r1 = 2*(2*f0)*sinc(2*[-Ordre1*Te:Te:Ordre1*Te]*pi*(2*f0));

wr = rectwin(length(r1));
wb = blackman(length(r1));

r11 = r1.*wr.';
R11 = fftshift(fft(r11));

r22 = r1.*wb.';
R22=fftshift(fft(r22));

figure();
plot([-Ordre1*Te:Te:Ordre1*Te],r11); hold on;
plot([-Ordre1*Te:Te:Ordre1*Te],r22);
title("Figure 9");
xlabel("Temps (s)");
ylabel(" Morceau de la réponse impulsionnelle idéale");
legend("Fenêtre rectangulaire" , "Fenêtre de Blackman");

figure();
plot(linspace(0,Fe,length(R11)) , abs(R11)); hold on;
plot(linspace(0,Fe,length(R22)) , abs(R22));
title("Figure 10");
xlabel("Fréquences (Hz)");
ylabel("TF de la réponse impulsionnelle idéale");
legend("Fenêtre rectangulaire" , "Fenêtre de Blackman");

%Vérification du filtrepour l'ordre 2 et pour la troncateur Blackman

r23 = 2*(2*f0)*sinc(2*[-Ordre2*Te:Te:Ordre2*Te]*pi*(2*f0));
wb2 = blackman(length(r23));
r23_1 = r23.*wb2.';
R23 = fftshift(fft(r23_1));

Tn = (1/max(abs(T)))*abs(T);
figure();
plot([0:Fe/N:Fe-Fe/N],Tn); hold on;
plot(linspace(0,Fe,length(R23)) , abs(R23));

title("Figure 11");
xlabel("Fréquences (Hz)");
ylabel("La transofrmée de Fourier");
legend(" module de TF en sortie ", "Réponse du filtre");

%Réalisation du filtrage

p = conv(t,r23_1,'same');

figure();
plot(linspace(0,Nb*Ts,length(m)),m); hold on;
plot(linspace(0,Nb*Ts,length(p)),p);
ylim([-2,2]);
title("Figure 12");
xlabel("Temps (s) ");
ylabel("Message et signal filtré");
legend("Message " , "Signal en sortie du filtre");