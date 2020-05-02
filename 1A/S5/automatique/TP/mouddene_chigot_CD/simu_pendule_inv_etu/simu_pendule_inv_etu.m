% ~gergaud/ENS/Automatique/TP19-20/TP_Etudiants/simu_pendule_etu/simu_pendule_inv_eut.m
%
%
% Auteur : Gergaud Joseph
% Date : october 2018
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
addpath('./Ressources');
fich_simulink_etu = './pendule_inv_etu'
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
g = 9.81; l = 10;   % constantes
xe = [0 0]';         % (x_e, u_e) point de fonctionnement
ue = 0;             %

% Cas 1
% -----
x0 = [pi/20 0]';       % initial point

% Cas 1.1
fich = 'cas1_1';

tf = 10;              % temps final
K = [30 10];
algorithme = 'ode45';
RelTol = '1e-3';

simu_pendule_inv

% Cas 1.2
fich = 'cas1_2';

tf = 10;              % temps final
K = [10 1];
algorithme = 'ode45';
RelTol = '1e-3';

simu_pendule_inv

% Cas 1.3
fich = 'cas1_3';

tf = 100;              % temps final
K = [10 1];
algorithme = 'ode45';
RelTol = '1e-3';

simu_pendule_inv

% Cas 1.4
tf = 100
fich = 'cas1_4';
K = [10 1];
pas = 10
algorithme = 'ode1';
pas = []
simu_pendule_inv;

% Cas 1.5
tf = 1000
fich = 'cas1_5';
K = [10 1];
algorithme = 'ode1';

simu_pendule_inv;

% Cas 1.6
tf = 1000
fich = 'cas1_6';
K = [10 1];
algorithme = 'ode45';
RelTol = '1e-3';

simu_pendule_inv;


% Cas 1.7
tf = 100
fich = 'cas1_7';
K = [10 1];
algorithme = 'ode1';
pas = 10;

simu_pendule_inv;

% Cas 2
% -----
x0 = [pi/10 0]';       % initial point

% Cas 2.1
fich = 'cas2_1';

tf = 100;              % temps final
K = [10 1];
algorithme = 'ode45';
RelTol = '1e-3';

simu_pendule_inv

% Cas 2.2
fich = 'cas2_2';

tf = 100;              % temps final
K = [30 10];
algorithme = 'ode45';
RelTol = '1e-3';

simu_pendule_inv