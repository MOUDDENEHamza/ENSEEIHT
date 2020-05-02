function tracer_droites_vers_point_de_fuite (rho, theta, x_F, y_F, x_max, y_max, couleur)

    for k = 1 : length(rho)
        
        x_bord = zeros(1,2);
        y_bord = zeros(1,2);
        ind = 1;
        
        % Cas où x = 0
        x = 0;
        y = rho(k)/sin(theta(k));
        if (y >= 0 && y <= y_max)
            x_bord(ind) = x;
            y_bord(ind) = y;
            ind = ind + 1;
        end
        
        % Cas où x = x_max
        x = x_max;
        y = rho(k)/sin(theta(k)) - x*cot(theta(k));
        if (y >= 0 && y <= y_max)
            x_bord(ind) = x;
            y_bord(ind) = y;
            ind = ind + 1;
        end
        % Cas où y = 0
        y = 0;
        x = rho(k)/cos(theta(k));
        if (x >= 0 && x <= x_max)
            x_bord(ind) = x;
            y_bord(ind) = y;
            ind = ind + 1;
        end
        
        % Cas où y = y_max
        y = y_max;
        x = rho(k)/cos(theta(k)) - y*tan(theta(k));
        if (x >= 0 && x <= x_max)
            x_bord(ind) = x;
            y_bord(ind) = y;
        end
        
        plot(x_bord, y_bord, couleur);
        
    end

end