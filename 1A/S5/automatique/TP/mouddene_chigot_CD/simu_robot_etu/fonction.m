function [ dx ] = fonction( x, u)
%   Dynamic equations of motion of the segway on an axis.
%   Inputs: - x = [theta psi dtheta dpsi]
%               theta: average angle of the wheels      [rad]
%               psi: body pitch angle                   [rad]
%               dtheta: average velocity of the wheels  [rad/s]
%               dpsi: body pitch velocity               [rad/s]
%          - u: DC motor voltage (same value for both motors) [V]

    % State
    psi = x(2);
    dtheta = x(3);
    dpsi = x(4);

    % Parameters
    
    g = 9.81;           % gravity acceleration [m/sec^2]
    m = 0.03;           % wheel weight [kg]
    R = 0.04;           % wheel radius [m]
    Jw = m*R^2/2;       % wheel inertia moment [kg*m^2]
    M = 0.6;            % body weight [kg]
    H = 0.144;          % body height [m]
    L = H/2;            % distance of the center of mass from the wheel axle [m]
    Jpsi = M*L^2/3;     % body pitch inertia [kgm^2]
    Jm = 1e-5;          % DC motor inertia moment [kgm^2]
    Rm = 6.69;          % DC motor resistance [Ohm]
    Kb = 0.468;         % DC motor back EMF constant [Vsec/rad]
    Kt = 0.317;         % DC motor torque constant [Nm/A]
    n = 1;              % gear ratio
    fm = 0.0022;        % friction coefficient between body and DC motor
    fw = 0;             % friction coefficient between wheel and floor
    
    % Equations of motion
    c1 = (2*m+M)*R^2 + 2*Jw + 2*n^2*Jm;
    c2 = M*L*R*cos(psi) - 2*n^2*Jm;
    c3 = -M*L*R*dpsi^2*sin(psi);
    c4 = M*L^2 + Jpsi + 2*n^2*Jm;
    c5 = -M*g*L*sin(psi);

    alpha = Kt/Rm;
    beta = Kt*Kb/Rm + fm;

    Ftheta = alpha*(2*u) - 2*(beta+fw)*dtheta + 2*beta*dpsi;
    Fpsi = -alpha*(2*u) + 2*beta*dtheta - 2*beta*dpsi;

    ddtheta = (c4*c3 - c2*c5 + c4*Ftheta - c2*Fpsi)/(c4*c1 - c2^2);
    ddpsi = (Fpsi- c2*ddtheta - c5)/c4;
    dx = [dtheta dpsi ddtheta ddpsi]';

end


