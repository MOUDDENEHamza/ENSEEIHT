%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Analyse de données
% TP3 - Classification bayésienne
% donnees.m
%--------------------------------------------------------------------------

clear
close all
clc

taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Chemin d'accès aux images
chemin = '/mnt/n7fs/ens/tp_gasparini/images/';

%% Images de pensées

% Chargement des images
fichier = [chemin 'pensees'];
s = whos('-file',fichier);
nb_images_pensees = length(s);
load(fichier);

% Affichage des images
fact = factor(nb_images_pensees);
nb_lignes_affichage = fact(2);
nb_colonnes_affichage = fact(1);

figure('Name','Images de pensées',...
       'Position',[0.1*L,0.1*H,0.25*L,0.75*H]);

for i = 1:nb_images_pensees
	subplot(nb_lignes_affichage,nb_colonnes_affichage,i)
	imagesc(eval(['pe' num2str(i)]))
	title(['Pensée n°' num2str(i)])
	axis off image
end

%% Images d'oeillets

% Chargement des images
fichier = [chemin 'oeillets'];
s = whos('-file',fichier);
nb_images_oeillets = length(s);
load(fichier);

% Affichage des images
fact = factor(nb_images_oeillets);
nb_lignes_affichage = fact(2);
nb_colonnes_affichage = fact(1);

figure('Name','Images d''oeillets',...
       'Position',[0.4*L,0.1*H,0.25*L,0.75*H]);

for i = 1:nb_images_oeillets
	subplot(nb_lignes_affichage,nb_colonnes_affichage,i)
	imagesc(eval(['oe' num2str(i)]))
	title(['Oeillet n°' num2str(i)])
	axis off image
end

%% Images de chrysanthèmes

% Chargement des images
fichier = [chemin 'chrysanthemes'];
s = whos('-file',fichier);
nb_images_chrysanthemes = length(s);
load(fichier);

% Affichage des images
fact = factor(nb_images_chrysanthemes);
nb_lignes_affichage = fact(2);
nb_colonnes_affichage = fact(1);

figure('Name','Images de chrysanthèmes',...
       'Position',[0.7*L,0.1*H,0.25*L,0.75*H]);

for i = 1:nb_images_chrysanthemes
	subplot(nb_lignes_affichage,nb_colonnes_affichage,i);
	imagesc(eval(['ch' num2str(i)]));
	title(['Chrysanthème n°' num2str(i)]);
	axis off image
end

drawnow;

clear chemin fact fichier i nb_lignes_affichage nb_colonnes_affichage s taille_ecran
save donnees
