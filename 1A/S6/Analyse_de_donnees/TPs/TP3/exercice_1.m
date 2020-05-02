%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Analyse de données
% TP3 - Classification bayésienne
% exercice_1.m
%--------------------------------------------------------------------------

clear
close all
clc

% Chargement des données
load donnees

%% Calcul des vecteurs de moyenne des images de fleurs

% Couleur moyenne de chaque image de pensée (fonction moyenne à coder)
X_pensees = single(zeros(nb_images_pensees,2));
for i = 1:nb_images_pensees
	im = eval(['pe' num2str(i)]);
	X_pensees(i,:) = moyenne(im);
end

% Couleur moyenne de chaque image d'oeillet (fonction moyenne à coder)
X_oeillets = single(zeros(nb_images_oeillets,2));
for i = 1:nb_images_oeillets
	im = eval(['oe' num2str(i)]);
	X_oeillets(i,:) = moyenne(im);
end

% Couleur moyenne de chaque image de chrysanthème (fonction moyenne à coder)
X_chrysanthemes = single(zeros(nb_images_chrysanthemes,2));
for i = 1:nb_images_chrysanthemes
	im = eval(['ch' num2str(i)]);
	X_chrysanthemes(i,:) = moyenne(im);
end

%% Affichage des couleurs moyennes des images de fleurs

% Vecteur r et v pour les axes
pas = 0.0025;
r = 0.35:pas:0.60;
v = 0.2:pas:0.45;

nb_r = length(r);
nb_v = length(v);

figure('Name','Couleurs moyennes des images',...
       'Position',[0.1*L,0.1*H,0.5*L,0.8*H])
   
    hold on
    plot(X_pensees(:,1),X_pensees(:,2),'r*','MarkerSize',10,'LineWidth',2)
    plot(X_oeillets(:,1),X_oeillets(:,2),'go','MarkerSize',10,'LineWidth',2)
    plot(X_chrysanthemes(:,1),X_chrysanthemes(:,2),'b+','MarkerSize',10,'LineWidth',2)
    
    grid on
    axis equal ij
    axis([r(1) r(end) v(1) v(end)])
    hx = xlabel('$\bar{r}$','FontSize',20);
    set(hx,'Interpreter','Latex')
    hy = ylabel('$\bar{v}$','FontSize',20);
    set(hy,'Interpreter','Latex')
    legend('Pensées','Oeillets','Chrysanthèmes','Location','Best')
    view(-90,90)
    title('Couleurs moyennes des images','FontSize',20)

clear ch* hx hy i* oe* pas pe*
save resultats_ex1
