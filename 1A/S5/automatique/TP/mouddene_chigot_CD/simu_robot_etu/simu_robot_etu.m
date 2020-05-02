% ~gergaud/ENS/Automatique/TP19-20/TP_Etudiants/simu_robot/simu_rotot_etu.m
%
%
% Auteur : Gergaud Joseph
% Date : october 2019
% Institution : Université de Toulouse, INP-ENSEEIHT
%               Département Sciences du Numérique
%               Informatique, Mathématiques appliquées, Réseaux et Télécommunications
%               Computer Science department
%
%-----------------------------------------------------------------------------------------
% 
% Code Matlab de test pour la simulation du pendule inversé contrôlé. 
%
%-----------------------------------------------------------------------------------------


% Remarque : On ne fait pas de sous programme car Simulink utilise
% l'environnement Matlab
%
clear all; close all;
addpath('../../','./Ressources');
% Pour une figure avec onglet
set(0,  'defaultaxesfontsize'   ,  12     , ...
   'DefaultTextVerticalAlignment'  , 'bottom', ...
   'DefaultTextHorizontalAlignment', 'left'  , ...
   'DefaultTextFontSize'           ,  12     , ...
   'DefaultFigureWindowStyle','docked');
%
% Initialisations
% ---------------
t0 = 0;             % temps initial
xe = [0 0 0 0]';     % (x_e, u_e) point de fonctionnement
ue = 0;             %

% Cas 1
% -----

fich_simulink_etu = './robot_etu'

% Cas 1.1

fich = 'cas1_1';
x0 = [0 0 0 0]';
tf = 2;             % temps final
K = [0 0 0 0];
algorithme = 'ode45';
RelTol = '1e-3';

simu_robot


% Cas 1.2

fich = 'cas1_2';

tf = 2;             % temps final

x0 = [0 pi/10 0 0]'; % initial point
K = -[-0.6700  -19.9055   -1.0747   -1.9614];
delta_t = 0.02         % si nécessaire
algorithme = 'ode45';
RelTol = '1e-3';

simu_robot