
clear
close all
clc

% Tests de la fonction d'advection
fct_advection('porte','explicit',200,600);


function fct_advection(signal, schema, Nt, Nx)
% Script calculant une approximation de la solution du probleme 
% d'advection lineaire 1D
% 
%  Inputs
%  ------
%  signal : signal utilise pour le test ('porte' ou 'gaussienne')
%  schema : schema numerique a utiliser ('explicit', 'implicit', 'LaxWendroff')
%  Nt : nombre de pas de temps
%  Nx : Nx+1 pas d'espace

    % Cadre experimental
    a = 1; % vitesse de propagation
    L = 3; % longueur du domaine spatial
    T = 1; % longueur de la fenetre temporelle

    % Definition de la grille
    dx = L/(Nx+1);
    dt = T/(Nt+1);
    xx = (0:Nx+1)';

    % Nombre de Courant 
    lambda = a*dt/dx;
    disp(['lambda = ' num2str(lambda)])

    % Condition initiale
    u_0 = reference(signal,lambda,Nx,dx,0);
    RMSE = zeros(Nt+1,1);

    % Initialisation de u_{n} et u_{n+1}
    u_n = u_0;
    u_np1 = u_0;
    
    % Matrice A du systeme AX = B pour le schema implicite
    %%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%   TO DO   %%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%

    for k = 1:Nt+1

        % Interieur du domaine
        %%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%   TO DO   %%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%

        % Conditions aux limites
        %%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%   TO DO   %%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%

        % Erreur RMS
        u_ref = reference(signal,lambda,Nx,dx,k);
        RMSE(k) = norm(u_n-u_ref,2)/norm(u_ref,2);

        % Affichage de la solution
        figure(1)
        plot(dx*xx,u_n,'b-',dx*xx,u_ref,'r-');
        axis([0 L -1 max(abs(u_0))+1]);
        title(['Evolution de la ' signal ' au cours du temps'])
        legend('Solution numerique','Solution de reference',...
               'Location','northwest');
        xlabel('Domaine spatial')
        ylabel('u')
        pause(eps);

    end
  
    % Affichage de l'erreur RMS 
    figure(2)
    plot(1:Nt+1, RMSE);
    xlim([1 Nt+1])
    title('Erreur RMS en fonction des iterations')
    xlabel('Iteration')
    ylabel('Erreur RMS')

end
