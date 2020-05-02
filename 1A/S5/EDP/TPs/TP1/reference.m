function u_ref = reference(signal, lambda, Nx, dx, kt)
% Evaluation de la solution de reference en les points du maillage
% u_ref(x) = u0(x-a*t)
%
% Inputs :
% ------
% signal : 'porte' ou 'gaussienne'
% lambda: nombre de Courant
% Nx : Nombre de pas d'espace
% dx : Pas d'espace
% kt : Indice du pas de temps courant
%
% Output :
% ------
% u_ref : solution evaluee en les noeuds du maillage
%
%*****************************************

    u_ref = zeros(Nx+2,1);
    
    switch signal

        case 'porte'
            % Fonction porte 
            xi = 0.25;
            xj = 1;
            xx = 0:Nx+2;
            u_ref((dx*xx>=xi+dx*lambda*kt)&(dx*xx<=xj+dx*lambda*kt)) = 2;

        case 'gaussienne'
            % Densite gaussienne
            gaussian = @(x,m,var)exp(-(x-m)^2/(2*var^2))/(var);  
            n0 = 1;
            var0 = 0.1;
            for j = 2:Nx+1
                u_ref(j) = gaussian((j-lambda*kt)*dx,n0,var0)/5;
            end

        otherwise
            error('Signal non reconnu');

    end
end
