% Tableaux contenant les valeurs propres pour des matrices d'ordre 100 
% pour les quatres types de matrice.
load('type1.mat','-ascii')
load('type2.mat','-ascii')
load('type3.mat','-ascii')
load('type4.mat','-ascii')

% Type 1
figure
subplot(2,2,1)
plot((1:100),type1);
title("Spectral representation of a type 1 matrix")
xlabel('Classification of eigenvalues');
ylabel('Eigenvalues');

% Type 2
subplot(2,2,2)
plot((1:100),type2);
title("Spectral representation of a type 2 matrix")
xlabel('Classification of eigenvalues');
ylabel('Eigenvalues');

% Type 3
subplot(2,2,3)
plot((1:100),type3);
title("Spectral representation of a type 3 matrix")
xlabel('Classification of eigenvalues');
ylabel('Eigenvalues');

% Type 4
subplot(2,2,4)
plot((1:100),type4);
title("Spectral representation of a type 4 matrix")
xlabel('Classification of eigenvalues');
ylabel('Eigenvalues');