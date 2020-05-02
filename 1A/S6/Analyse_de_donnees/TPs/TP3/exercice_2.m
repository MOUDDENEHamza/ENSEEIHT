%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Analyse de données
% TP3 - Classification bayésienne
% exercice_2.m
%--------------------------------------------------------------------------

clear
close all
clc

% Chargement des données de l'exercice 1
load resultats_ex1

azimuth = -72;
elevation = 42;

%% Estimation pour les pensées

% Estimation des paramètres de la loi normale (fonction estimation_mu_Sigma à coder)
[mu_pensees, Sigma_pensees] = estimation_mu_Sigma(X_pensees);

% Valeurs de la loi normale sur la grille
[V_pensees, denominateur_classe_pensees]  = vraisemblance(r, v, mu_pensees, Sigma_pensees, -1);

% Représentation 3D de la loi normale
figure('Name','Vraisemblance de la classe "pensées"',...
       'Position',[0.05*L,0.1*H,0.3*L,0.6*H])
    hold on
    surface(r,v,V_pensees,'EdgeColor',[.85 .65 .65],'FaceColor','none')
    axis([r(1) r(end) v(1) v(end)])
    view(azimuth,elevation)
    rotate3d on

% Superposition des données d'apprentissage de la classe "pensées"
    plot(X_pensees(:,1),X_pensees(:,2),'r*','MarkerSize',10,'LineWidth',2)
    grid on
    hx = xlabel('$\bar{r}$','FontSize',20);
    set(hx,'Interpreter','Latex')
    hy = ylabel('$\bar{v}$','FontSize',20);
    set(hy,'Interpreter','Latex')
    title('Estimation pour les pensees','FontSize',20)
    legend('Vraisemblance empirique','Donnees d''apprentissage','Location','Best')

%% Estimation pour les oeillets

% Estimation des paramètres de la loi normale (fonction estimation_mu_Sigma à coder)
[mu_oeillets, Sigma_oeillets] = estimation_mu_Sigma(X_oeillets);

% Valeurs de la loi normale sur la grille
[V_oeillets, denominateur_classe_oeillets]  = vraisemblance(r, v, mu_oeillets, Sigma_oeillets, -1);

% Représentation 3D de la loi normale
figure('Name','Vraisemblance de la classe "oeillets"',...
       'Position',[0.35*L,0.1*H,0.3*L,0.6*H])
    hold on
    surface(r,v,V_oeillets,'EdgeColor',[.65 .85 .65],'FaceColor','none')
    axis([r(1) r(end) v(1) v(end)])
    view(azimuth,elevation)
    rotate3d on

    % Trace des données d'apprentissage de la classe "oeillets"
    plot(X_oeillets(:,1),X_oeillets(:,2),'go','MarkerSize',10,'LineWidth',2)
    grid on
    hx = xlabel('$\bar{r}$','FontSize',20);
    set(hx,'Interpreter','Latex')
    hy = ylabel('$\bar{v}$','FontSize',20);
    set(hy,'Interpreter','Latex')
    title('Estimation pour les oeillets','FontSize',20)
    legend('Vraisemblance empirique','Données d''apprentissage','Location','Best')

%% Estimation pour les chrysanthèmes

% Estimation des paramètres de la loi normale (fonction estimation_mu_Sigma à coder)
[mu_chrysanthemes, Sigma_chrysanthemes] = estimation_mu_Sigma(X_chrysanthemes);

% Valeurs de la loi normale sur la grille
[V_chrysanthemes, denominateur_classe_chrysanthemes]  = vraisemblance(r, v, mu_chrysanthemes, Sigma_chrysanthemes, -1);

% Représentation 3D de la loi normale
figure('Name','Vraisemblance de la classe "chrysanthèmes"',...
       'Position',[0.65*L,0.1*H,0.3*L,0.6*H])
    hold on
    surface(r,v,V_chrysanthemes,'EdgeColor',[.65 .65 .85],'FaceColor','none')
    axis([r(1) r(end) v(1) v(end)])
    view(azimuth,elevation)
    rotate3d on

    % Trace des données d'apprentissage de la classe "chrysanthèmes"
    plot(X_chrysanthemes(:,1),X_chrysanthemes(:,2),'b+','MarkerSize',10,'LineWidth',2)
    grid on
    hx = xlabel('$\bar{r}$','FontSize',20);
    set(hx,'Interpreter','Latex')
    hy = ylabel('$\bar{v}$','FontSize',20);
    set(hy,'Interpreter','Latex')
    title('Estimation pour les chrysanthèmes','FontSize',20)
    legend('Vraisemblance empirique','Données d''apprentissage','Location','Best')
  
clear azimuth elevation hx hy i j r_i x_centre
save resultats_ex2
