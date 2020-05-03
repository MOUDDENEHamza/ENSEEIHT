clear variables
close all

% chargement du jeu de donn�es
load('dataset.mat')

%% Calcule des param�tres du tableau
n = size(X,1);
nb_param = size(X,2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CALCULER LA MATRICE DE VARIANCE/COVARIANCE DU TABLEAU DES DONNEES X, ET
% LES AXES PRINCIPAUX. REORDONNER CES AXES PAR ORDRE DECROISSANT DU
% CONTRASTE QU'ILS FOURNISSENT.
% CALCULER LA MATRICE C DE L'ECHANTILLON DANS CE NOUVEAU REPERE.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

X_moy = mean(X); %X_moy est un vecteur qui repr�sente l'individu moyen . 
X_c = X - X_moy; %X_c est la matrice centr�e
Sigma = (1/n)*transpose(X_c)*X_c  %Sigma est la matrice de variance/covariance
[W , D] = eig(Sigma);  %W est une matrice contenant les vecteurs propres de Sigma , D est une matrice diagonale
%contenant ses valeurs propres
contraste = (1/trace(D))*diag(D); %contraste est un vecteur contenant les contrastes .
[contraste_trie , indices] = sort(contraste,'descend'); %Trier les valeurs propres par ordre d�croissant .
U = W(: , indices);  %U repr�sente la matrice de passage de la base des axes principaux vers la base canonique .
C = X_c*U; %C est une matrice qui exprime les donn�es dans le nouveau rep�re . 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AFFICHER LA PROJECTION DE XC SUR :
% - LE PREMIER AXE PRINCIPAL
% - LE DEUXIEME AXE PRINCIPAL
% - LE TROISIEME AXE PRINCIPAL
%

figure(1),clf
subplot(3,1,1)
plot(0,0,'ko','linewidth',2);
hold on,plot([0 1.5*max(C(:,1))],[0 0],'k-');
hold on, plot(C(:,1),zeros(1,n),'r+','linewidth',2);grid on
legend('origine du repere','vecteur de base','individus');
title('1ere composante ppale')

subplot(3,1,2)
plot(0,0,'ko','linewidth',2);
hold on,plot([0 1.5*max(C(:,1))],[0 0],'k-');
hold on, plot(C(:,2),zeros(1,n),'g+','linewidth',2);grid on
legend('origine du repere','vecteur de base','individus');
title('2eme composante ppale')

subplot(3,1,3)
plot(0,0,'ko','linewidth',2);
hold on,plot([0 1.5*max(C(:,1))],[0 0],'k-');
hold on, plot(C(:,3),zeros(1,n),'b+','linewidth',2);grid on
legend('origine du repere','vecteur de base','individus');
title('3eme composante ppale')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AFFICHER LES DEUX PREMIERES COMPOSANTES PRINCIPALES DE X DANS LE PLAN, 
% PUIS AFFICHER LES TROIS PREMIERES COMPOSANTES PRINCIPALES DE X DANS 
% L'ESPACE. 

figure(2), clf, 
plot(C(:,1),C(:,2),'r+','linewidth',2);
grid on 
title('Proj. des donnees sur les deux 1ers axes ppaux')

figure(3),clf, 
grid on
plot3(C(:,1),C(:,2),C(:,3),'b+','linewidth',2);
title('Proj. des donnees sur 3 1ers axes ppaux')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AFFICHER UNE FIGURE MONTRANT LE POURCENTAGE D'INFORMATION APPORTEE PAR
% CHAQUE COMPOSANTE PRINCIPALE. 
% EN ABSCISSE DOIT SE TROUVER LE NUMERO DE LA COMPOSANTE OBSERVEE, EN 
% ORDONNEE ON MONTRERA LE POURCENTAGE D'INFO QUE CONTIENT CETTE COMPOSANTE.

figure(4),clf
p = length(contraste_trie);
plot([1:p],contraste_trie,'r+','linewidth',2)
title('Pourcentage d info contenue sur chaque composante ppale -- later classes')
xlabel('num de la comp. ppale');ylabel('pourcentage d info');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% UTILISATION DE kmeans sur les 3 premi�res composantes.
v = kmeans(C(:,1:3),6);
figure(5),
for i = 1:6
    indices = find(v == i);
    plot3(C(indices,1),C(indices,2),C(indices,3),'*');grid on;hold on
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% UTILISATION DE kmeans sur la 4�me,5�me et 6�me composantes.
w = kmeans(C(:,4:6),7);
figure(6),
for i = 1:7
    indices = find(w == i);
    plot3(C(indices,4),C(indices,5),C(indices,6),'*');grid on;hold on
end

