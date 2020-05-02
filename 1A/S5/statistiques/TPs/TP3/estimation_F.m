function [rho_F, theta_F ] = estimation_F(rho, theta)
    A =  [cos(theta), sin(theta)];
    X_F = pinv(A) * rho;
    x_F = X_F(1);
    y_F = X_F(2);
    rho_F = sqrt(x_F ^ 2 + y_F ^ 2);
    theta_F = atan2(y_F, x_F);
end