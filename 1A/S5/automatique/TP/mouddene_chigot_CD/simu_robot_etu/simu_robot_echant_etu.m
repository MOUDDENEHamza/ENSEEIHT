% ~gergaud/ENS/Automatique/TP19-20/TP_Etudiants/simu_robot/Ressources/simu_robot.m
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


fich_simulink_etu = './robot_echant_etu'
affichage(fich, t0, xe, ue, x0, tf, K, options_sim);

Out = sim(fich_simulink_etu,[t0 tf],options_sim);

X   = Out.X;
U   = Out.U;

figure;
graphiques(X,U)

%
% Fonctions
function affichage(fich, t0, xe, ue, x0, tf, K, options_sim);
%
% Attichage des données
disp(fich)
disp('[t0 xe ue]')
disp([t0 xe(:)' ue(:)'])
disp('[x0 tf K]=')
disp([x0(:)' tf K])
disp(['algorithme = ' options_sim.Solver]);
disp(['RelTol = ' options_sim.RelTol]);
disp(['pas = ' num2str(options_sim.FixedStep)]);
end


function graphiques(x,u)
% Réalise les graphiques des simulations issues de simulink
%
% parametres en entrée
% --------------------
% t : temps
%     real (N,1)
% x : état
%     real (N,n)
% u : contrôle
%     real (N,m)

subplot(2,1,1)
plot(x.Time,x.Data)
xlabel('t')
ylabel('états');
subplot(2,1,2)
plot(u.Time,u.Data)
xlabel('t')
ylabel('contrôle')

end