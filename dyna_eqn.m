%% Dynamical Equation Development

%syms phi phi_dot the1 the1_dot the2 the2_dot the_a the_a_dot Q Q_dot
syms t

sym_phi = phi(t);
the1 = theta1(t);
the2 = theta2(t);
the_a = theta_a(t);
sym_Q = Q(t);

sym_phi_dot = diff(sym_phi,t);
the1_dot = diff(the1,t);
the2_dot = diff(the2,t);
the_a_dot = diff(the_a,t);
sym_Q_dot = diff(sym_Q,t);


g = 9.8;

%% Dimensions
l1 = 0.45;
l2 = 0.45;
l3 = 0.15;
l4 = 0.1;
l5 = 0.4;

%% Masses
m1 = 1;
m2 = 1;
m3 = 1;
m4 = 1;
m5 = 1;
m6 = 1;
m7 = 1;

%% Moments of Inertias
Ixx2 = (1/12)*m2*l1^2*(cos(sym_phi))^2;
Ixx3 = (1/12)*m3*l2^2*(cos(sym_phi))^2;
Ixx4 = (1/12)*m4*l5^2;
Ixx5 = (1/12)*m5*l2^2*(cos(the1))^2;
Ixx6 = (1/12)*m6*l1^2*(cos(the2))^2;
Ixx7 = (1/12)*m7*l3^2*(cos(the_a))^2;
Iyy2 = (1/12)*m2*l1^2*(cos(sym_Q))^2;
Iyy3 = (1/12)*m3*l2^2*(cos(sym_Q))^2;
Iyy4 = 0;
Iyy5 = (1/12)*m5*l2^2*(cos(sym_Q))^2;
Iyy6 = (1/12)*m6*l1^2*(cos(sym_Q))^2;
Iyy7 = (1/12)*m7*l3^2;


%% Kinetic Energies
KE1 = 0;
KE2 = (0.5)*m2*((sym_phi_dot*l1*0.5)^2 + (sym_Q_dot*l1*0.5*cos(sym_phi))^2) + (1/2)*Iyy2*sym_phi_dot^2 + (1/2)*Ixx2*sym_Q_dot^2;
KE3 = (0.5)*m3*((sym_phi_dot*(l1 + l2*0.5))^2 + (sym_Q_dot*(l1 + l2*0.5)*cos(sym_phi))^2) + (1/2)*Iyy3*sym_phi_dot^2 + (1/2)*Ixx3*sym_Q_dot^2;
KE4 = (0.5)*m4*((sym_phi_dot*(l1 + l2))^2 + (sym_Q_dot*(l1 + l2)*cos(sym_phi))^2) + (1/2)*Iyy4*sym_phi_dot^2 + (1/2)*Ixx4*sym_Q_dot^2;
KE5 = (0.5)*m5*((sym_phi_dot*(l1 + l2)*cos(sym_phi) + the1_dot*l2*0.5*cos(the1))^2 + (sym_phi_dot*(l1 + l2)*sin(sym_phi) + the1_dot*l2*0.5*sin(the1))^2 ...
    +(sym_Q_dot*(l1 + l2)*cos(sym_phi))^2) + (1/2)*Iyy5*the1_dot^2 + (1/2)*Ixx5*sym_Q_dot^2;
KE6 = (0.5)*m6*((sym_phi_dot*(l1 + l2)*cos(sym_phi) + the1_dot*l2*0.5*cos(the1)+ the2_dot*l1*0.5*cos(the2))^2 + ...
        (sym_phi_dot*(l1 + l2)*sin(sym_phi) + the1_dot*l2*0.5*sin(the1)+ the2_dot*l1*0.5*sin(the2))^2 +...
        (sym_Q_dot*0.5*(l1 - l2)*cos(sym_phi))^2) + (1/2)*Iyy6*the2_dot^2 + (1/2)*Ixx6*sym_Q_dot^2;
KE7 = (0.5)*m7*((sym_phi_dot*(l1 + l2)*cos(sym_phi) + the1_dot*l2*0.5*cos(the1)+ the2_dot*l1*0.5*cos(the2) + the_a_dot*0.5*l3*cos(the_a))^2 + ...
        (sym_phi_dot*(l1 + l2)*sin(sym_phi) + the1_dot*l2*0.5*sin(the1)+ the2_dot*l1*0.5*sin(the2) + the_a_dot*0.5*l3*sin(the_a))^2 +...
        (sym_Q_dot*0.5*(l1 - l2)*cos(sym_phi))^2) + (1/2)*Iyy6*the2_dot^2 + (1/2)*Ixx7*the_a_dot^2;
    

%% Potential Energies
PE1 = 0;
PE2 = m2*g*l1*0.5*cos(sym_phi);
PE3 = m3*g*(l1+l2*0.5)*cos(sym_phi);
PE4 = m4*g*(l1+l2)*cos(sym_phi);
PE5 = m5*g*((l1+l2)*cos(sym_phi) - l2*0.5*cos(the1));
PE6 = m6*g*((l1+l2)*cos(sym_phi) - l2*cos(the1) - l1*0.5*cos(the2));
PE7 = m7*g*((l1+l2)*cos(sym_phi) - l2*cos(the1) - l1*cos(the2) - l3*0.5*cos(the_a));


%% Lagragian and derivatives
Lagrag = (KE1 + KE2 + KE3 + KE4 + KE5 + KE6 + KE7) + (PE1 + PE2 + PE3 + PE4 + PE5 + PE6+ PE7);

dL_dphi  =  diff(Lagrag,sym_phi);
dL_the1  =  diff(Lagrag,the1);
dL_the2  =  diff(Lagrag,the2);
dL_the_a =  diff(Lagrag,the_a);
dL_Q     =  diff(Lagrag,sym_Q);
dL_dphi_dot   = diff(Lagrag,sym_phi_dot);
dL_dthe1_dot  = diff(Lagrag,the1_dot);
dL_dthe2_dot  = diff(Lagrag,the2_dot);
dL_dthe_a_dot = diff(Lagrag,the_a_dot);
dL_Q          = diff(Lagrag,sym_Q);

%% Equations

