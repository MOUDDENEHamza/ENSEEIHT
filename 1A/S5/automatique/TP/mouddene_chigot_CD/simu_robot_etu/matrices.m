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
    

% Matrices of the linearized system
E = [(2*m+M)*R^2+2*Jw+2*Jm   M*L*R-2*Jm; M*L*R-2*Jm   M*L^2+Jpsi+2*Jm];
detE = det(E);

alpha = Kt/Rm;
beta = Kt*Kb/Rm + fm;

A32 = -M*g*L*E(1,2)/detE;
A42 = M*g*L*E(1,1)/detE;
A33 = -(beta*E(2,2)+2*beta*E(1,2))/detE;
A43 = (beta*E(1,2)+2*beta*E(1,1))/detE;
A34 = beta*(E(2,2)+2*E(1,2))/detE;
A44 = -beta*(E(1,2)+2*E(1,1))/detE;

B3 = alpha*(E(2,2)/2+E(1,2))/detE;
B4 = -alpha*(E(1,2)/2+E(1,1))/detE;

A = [0 0 1 0;0 0 0 1; 0 A32 A33 A34; 0 A42 A43 A44];
B = [0 0 2*B3 2*B4]';

poles       = [-136.5905, -2.6555, -3.5026, -5.9946]