clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Lecture d'une image interne a Matlab et conversion en doubles :
I_max = 255;
I_min = 0;
I = rgb2gray(imread('autumn.tif'));
I = double(I);

% Affichage de l'image :
figure('Name','Exemple d''image interne a Matlab','Position',[0,0,0.33*L,0.3*L]);
imagesc(I);
axis off;
axis equal;
colormap gray;

% Affichage de l'histogramme de l'image :
histogramme = hist(I(:),[I_min:I_max]);
figure('Name','Histogramme des niveaux de gris','Position',[0.33*L,0,0.33*L,0.3*L]);
plot([I_min:I_max],histogramme);
axis([I_min I_max 0 1.1*max(histogramme)]);
xlabel('Niveau de gris','FontSize',15);
ylabel('Frequence','FontSize',15);
set(gca,'FontSize',20);

% Calcul de vecteurs contenant les niveaux de gris de gauche (de droite) d'une paire de pixels :
[X,Y] = vectorisation(I);

% Affichage des paires de niveaux de gris sous la forme d'un nuage de points :
figure('Name','Mise en evidence de la correlation entre pixels voisins','Position',[0.66*L,0,0.33*L,0.3*L]);
plot(X,Y,'b+');
axis([I_min I_max I_min I_max]);
xlabel('Niveau de gris du pixel de gauche','FontSize',15);
ylabel('Niveau de gris du pixel de droite','FontSize',15);
hold on;
set(gca,'FontSize',20);
axis equal;

% Calcul des parametres de la droite de regression :
[r,a,b] = calcul_parametres(X,Y);
fprintf('Coefficient de correlation lineaire : %.4f\n',r);

% Affichage de la droite de regression (d'equation y = a*x+b) :
x = I_min:I_max;
y = a*x+b;
plot(x,y,'r','LineWidth',3);
