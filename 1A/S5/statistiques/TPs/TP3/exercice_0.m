clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% parametres
alpha = pi / 180 * 12; % Seuil sur l'orientation du gradient (en radians)
cos_alpha = cos( alpha );
Seuil_norme = 2 / sin( alpha ); % Seuil sur la norme du gradient (decoule d'une etude theorique)

% chargement des donnees
load parquet;
load bateau;

% Affichage de l'image :
figure('Name','Detection des alignements','Position',[0.2*L,0,0.8*L,H]);
subplot(2,2,1);
imagesc(I);
axis equal;
axis off;
colormap gray;
title('Image originale','FontSize',30);

% Affichage de l'image :
subplot(2,2,3);
imagesc(I);
axis equal;
axis off;
colormap gray;
hold on;

% Gradient du niveau de gris (x vers la droite, y vers le bas) :
I = double(I);
[G_x,G_y] = gradient(I);
G_norme = sqrt(G_x.^2+G_y.^2);

% Selection des pixels de contour :
contour = G_norme>Seuil_norme;

% Pas de pixel de contour sur le bord de l'image => Traitement simplifie !
[ nb_lignes, nb_colonnes ] = size(I);
contour([1 nb_lignes],:) = 0;
contour(:,[1 nb_colonnes]) = 0;

% Tri des pixels de contour :
indices_contour = find(contour);
[~,indices] = sort(G_norme(indices_contour),'descend');
indices_contour = indices_contour(indices);

% Affichage d'une petite fleche sur les pixels de contour :
[i,j] = ind2sub(size(I),indices_contour);
quiver(j,i,G_x(indices_contour),G_y(indices_contour),'r');		% Attention : x = j et y = i
axis equal;
title('Pixels de contour','FontSize',30);
drawnow;

% Affichage des ensembles E (la fonction label2rgb donne a chaque ensemble E une couleur differente) :
subplot(2,2,2);
imagesc(I_resultat);
axis equal;
axis off;
title('Ensembles candidats','FontSize',30);


% Affichage de l'esquisse :
subplot(2,2,4);
imagesc(120*ones(size(I)),[0,255]);
axis equal;
axis off;
title('Alignements','FontSize',30);
hold on;

% Boucle sur les ensembles E :
for k = 1:size(extremites, 3)
		% Affichage du segment :
		line(extremites(1,:,k),extremites(2,:,k),'Color','w','LineWidth',2);
end

save exercice_0;