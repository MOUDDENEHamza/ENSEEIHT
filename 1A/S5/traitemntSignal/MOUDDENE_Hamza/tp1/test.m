%Paramètres
f0=100; %fréquence du cosinus
Fe=1000; %fréquence d'échantillonnage
Te=1/Fe; %période d'échantillonnage
N=101; %nombre d'échantillons (-1)
%Génération du signal
x=cos(2*pi*f0*[0:Te:(N-1)*Te]);
%Tracé du signal
figure; plot(x)
%Calcul de la TFD du signal
X=fft(x);
%Tracé du module de la TFD du signal
figure; plot(abs(X))
xlabel('Fréquence en HZ')
ylabel('|TFD(x)|')
title('figure 4 : La transformée de Fourier avec Fe = 1000')