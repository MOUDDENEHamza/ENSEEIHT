Fe=10000;
Te = 1/Fe;
Rs=1000; 
alpha = 0.35;
f=2000;
span=8;
Ns=Fe/Rs;
nb_bits=100;
bits=randi([0,1],1,nb_bits);
Symboles_1=2bits-1; 
Symboles_2=2bits-1;
Symboles = Symboles_1 + 1iSymboles_2;
Suite_diracs_1=kron(Symboles_1, [1 zeros(1,Ns-1)]); 
Suite_diracs_2=kron(Symboles_2, [1 zeros(1,Ns-1)]); 
h = rcosdesign(alpha/2,span,Ns);
hr=h;
I = filter(h,1,[Suite_diracs_1 zeros(1,(spanNs)/2)]);
Q = filter(h,1,[Suite_diracs2 zeros(1,(spanNs)/2)]);
%supprimer le retard ajouté avant le filtrage
I=I((spanNs/2)+1:end);
Q=Q((spanNs/2)+1:end);
figure;
subplot(211);
plot(I);
title('composante en phase');
xlabel('temps en s');
ylabel('I');
subplot(212);
plot(Q);
title('composante en quadrature');
xlabel('temps en s');
ylabel('Q');
temps = 0:Te:(length(I)-1)Te;
signal = I.cos(2piftemps) - Q.sin(2piftemps);
figure;
plot(signal);
title('signal émis');
xlabel('temps en s');
ylabel('signalémis');
signal_recu  = filter(hr,1,[signal zeros(1,(spanNs)/2)]);
signal_recu = signal_recu(((spanNs)/2)+1:end);
%%
%2)%Affichage de la DSP du signal émis
figure;
DSP=(1/length(signal))abs(fft(signal,2^nextpow2(length(signal)))).^2;
plot(linspace(0,100,length(DSP)),fftshift(DSP));
title('DSP du signal émis');
ylabel('DSP');
xlabel('fréquence en Hz');
%%
%3) Implantation de la chaine sans bruit 
oeil = reshape(I,2Ns,length(I)/(2*Ns));
figure;
plot(oeil);
title('oeil');
ylabel('x');
xlabel('temps en s');
signal_echant = signal_recu(1:Ns:end);
symboles_decides = zeros(1,length(signal_recu));
%detecteur de seuil 
for i=1:length(signal_echant)
    if (I(i) <= 0 & Q(i) <= 0)
            symboles_decides(i) = -1 +1i;
    end 
    if (I(i) >= 0 & Q(i) >= 0)
            symboles_decides(i) = 1 + 1i;
    end
    if (I(i) <= 0 & Q(i) >= 0)
            symboles_decides(i) = -1 -1i;
    end
     if (I(i) >= 0 & Q(i) <= 0)
            symboles_decides(i) = 1 - 1i;
     end
end