
clear all
close all

% Choix des images parmi les 37 individus et 6 postures faciales :
numeros_individus = [1 3 5 6];
numeros_postures = [ 2 4 5 ];

% Chargement et conversion des images
chemin = './Images_Projet_2018';
X=[];
for i=numeros_individus
     for j=numeros_postures
         fichier = [chemin '/' num2str(i+3) '-' num2str(j) '.jpg'];
         Im=importdata(fichier);
         I=im2double(Im);
         r=I(:,:,1);
         v=I(:,:,2);
         b=I(:,:,3);
         X=[X;r(:)',v(:)',b(:)'];
    end
end



% % Nombre de lignes n de X (nombre d'images selectionnees) :
 nb_individus = length(numeros_individus);
 nb_postures = length(numeros_postures);
 n = nb_individus*nb_postures;
 
 % Dimensions des images
nb_lignes= 480;
nb_colonnes = 640;
p = nb_lignes*nb_colonnes;


% Affichage des images (un individu par ligne, une posture par colonne) :
for l = 1:n
	j = numeros_individus(floor((l-1)/nb_postures)+1);
	k = numeros_postures(mod((l-1),nb_postures)+1);
	img = reshape(X(l,:),nb_lignes,nb_colonnes,3);
	subplot(nb_individus,nb_postures,l);
	imagesc(img);
	axis image;
	axis off;
	title(sprintf('Ind. %s, Post. %s',num2str(j,'%2d'),num2str(k,'%1d')),'Fontsize',15);
end

save donneesCouleur