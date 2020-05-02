clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Affichage d'images aleatoires contenant au moins un carre noir :
figure('Name','Images binaires aleatoires','Position',[0.3*L,0,0.7*L,H]);
numero_image = 1;
T = 64;
p = 0.5;
liste_valeurs_t = 2:5;
for t = liste_valeurs_t

	% Tirage d'images aleatoires tant qu'aucun carre noir n'a ete detecte :
	aucun_carre_noir_detecte = 1;
	cpt_tirages = 0;
	while aucun_carre_noir_detecte

		% Tirage aleatoire d'une image :
		I = rand(T);
		I = I>p;

		% Detection des carres de cote t entierement noirs :
		J = zeros(T-t+1,T-t+1,t*t);
		for i = 1:t
			for j = 1:t
				k = (i-1)*t+j;
				J(:,:,k) = I(i:end-t+i,j:end-t+j);
			end
		end
		somme = sum(J,3);
		indices_carres_noirs = find(somme==0);
		if length(indices_carres_noirs)>0
			aucun_carre_noir_detecte = 0;
		end
		cpt_tirages = cpt_tirages+1;
	end

	% Affichage de l'image :
	subplot(2,2,numero_image);
	numero_image = numero_image+1;
	imagesc(I);
	axis off;
	axis equal;
	colormap gray;
	set(gca,'FontSize',20);
	nb_carres = length(indices_carres_noirs);
	if nb_carres==1
		title(['Il y a 1 carre noir ' num2str(t) '$\times$' num2str(t) ' : le voyez-vous ?'],'Interpreter','Latex');
	else
		title(['Il y a ' num2str(nb_carres) ' carres noirs ' num2str(t) '$\times$' num2str(t) ' : les voyez-vous ?'],'Interpreter','Latex');
	end
	hold on;
	fprintf('Tapez Entree pour surligner les carres noirs\n');
	pause;

	% Surlignage des carres de cote t entierement noirs :
	for k = 1:length(indices_carres_noirs)
		l = indices_carres_noirs(k);
		x = ceil(l/(T-t+1))-0.5;
		y = mod(l-1,T-t+1)+1-0.5;
		line([x,x],[y,y+t],'Color','r','Linewidth',2);
		line([x+t,x+t],[y,y+t],'Color','r','Linewidth',2);
		line([x,x+t],[y,y],'Color','r','Linewidth',2);
		line([x,x+t],[y+t,y+t],'Color','r','Linewidth',2);
	end
	if t<liste_valeurs_t(end)
		fprintf('Tapez Entree pour afficher une nouvelle image\n');
		pause;
	end
end