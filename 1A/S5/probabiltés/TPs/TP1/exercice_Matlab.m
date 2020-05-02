clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Lecture et affichage de l'image originale :
image_originale = imread('image_originale.png');
figure('Name','Image originale','Position',[0,0,0.33*L,0.3*L]);
imagesc(image_originale);
axis off;
axis equal;
colormap gray;

% Conversion des entiers non signés en doubles :
image_originale = double(image_originale);

% Ecriture de image_RVB :
image_RVB = ecriture_RVB(image_originale);

% Affichage de l'image RVB convertie en entiers non signes :
figure('Name','Image originale convertie en RVB','Position',[[0.33*L,0,0.33*L,0.3*L]]);
imagesc(uint8(image_RVB));
axis off;
axis equal;
