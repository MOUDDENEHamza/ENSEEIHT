clear;
close all;

load exercice_1;

% Parametres :
p = alpha/pi;
epsilon = 1e-20;

% Affichage de l'image :
figure('Name','Detection des alignements','Position',[0,0,L,0.67*H]);
subplot(1,2,1);
imagesc(I);
axis equal;
axis off;
colormap gray;
title('L''image','FontSize',30);
drawnow;

% Affichage d'un fond gris pour l'esquisse :
subplot(1,2,2);
imagesc(120*ones(size(I)),[0,255]);
axis equal;
axis off;
title('Son esquisse','FontSize',30);
hold on;

% Boucle sur les ensembles E :
nb_elimines = 0;
for k = 1:length(liste_E)

	% Calcul de la matrice d'inertie de l'ensemble candidat numero k :
	E = liste_E{k};
	E_x = E(:,2);					% Attention : x = j
	E_y = E(:,1);					% Attention : y = i
	indices_E = sub2ind(size(I),E_y,E_x);
	G_norme_E = G_norme(indices_E);
	[C_x,C_y,M] = matrice_inertie(E_x,E_y,G_norme_E);

	% Calcul des valeurs/vecteurs propres de M :
	[V,D] = eig(M);

	% Tri des valeurs propres de M par ordre decroissant :
	[~,indices] = sort(diag(D),'descend');

	% Matrice de passage du repere xy vers les axes propres du nuage de points :
	P = V(:,indices);

	% Coordonnees des points du nuage apres rotation dans le repere des axes principaux :
	E_nouveau_repere = [E_x-C_x,E_y-C_y]*P;

	% Calcul de probabilite (loi binomiale) :
	[x_min,x_max,probabilite] = calcul_proba(E_nouveau_repere,p);

	% Test de saillance visuelle :
	if probabilite<epsilon				% Si l'evenement est suffisamment rare
		% Affichage du segment :
		extremites = P*[x_min x_max ; 0 0]+[C_x C_x ; C_y C_y];
		line(extremites(1,:),extremites(2,:),'Color','w','LineWidth',2);
		drawnow;
	else
		nb_elimines = nb_elimines+1;
	end
end
fprintf( 'Sur %d ensembles candidats, %d ont ete elimines\n',length(liste_E),nb_elimines);
