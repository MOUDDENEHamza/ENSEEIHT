function [rho_F_1,theta_F_1] = RANSAC_2(rho,theta,parametres)
    n = length(rho);
    residu_min = Inf;
    for k = 1:parametres(3)
        a = randperm(n,2);
        [rho_F, theta_F] = estimation_F(rho(a), theta(a));
        residu = abs(rho - rho_F * cos(theta - theta_F));
        V = residu <= parametres(1);
        if sum(V) / length(V) >= parametres(2)            
            residu = sum(1 / length(V) * abs(rho(V) - rho_F * cos(theta(V) - theta_F)));
            if residu <= residu_min
                residu_min = residu;
                rho_F_1 = rho_F;
                theta_F_1 = theta_F;
            end
        end
    end
end