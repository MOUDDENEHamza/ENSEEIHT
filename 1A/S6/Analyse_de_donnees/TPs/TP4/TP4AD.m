%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Analyse de donnees
% TP4 - Reconnaissance de chiffres manuscrits par k plus proches voisins
% TP4AD.m
%--------------------------------------------------------------------------

clear
close all
clc

% Chargement des images d'apprentissage et de test
load MNIST

%   database_test_images       10000x784             
%   database_test_labels       10000x1             
%   database_train_images      60000x784           
%   database_train_labels      60000x1      

DataA = database_train_images;
clear database_train_images
DataT = database_test_images;
clear database_test_images
labelA = database_train_labels;
clear database_train_labels
labelT = database_test_labels;
clear database_test_labels

% Choix du nombre de voisins
K = 1;

% Initialisation du vecteur des classes
ListeClass = 0:9;

% Classement par l'algorithme des k-ppv
[Partition] = kppv(DataA,DataT,labelA, labelT,K,ListeClass);
