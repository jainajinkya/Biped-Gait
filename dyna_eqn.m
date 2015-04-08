%% Dynamical Equation Development
function torque = dyna_eqn(t_val)
syms sym_phi sym_phi_dot the1 the1_dot the2 the2_dot the_a the_a_dot sym_Q sym_Q_dot t
% syms t
%
sym_phi_val = phi(t_val,'char');
the1_val = theta1(t_val,'char');
the2_val = theta2(t_val,'char');
the_a_val = theta_a(t_val,'char');
sym_Q_val = Q(t_val,'char');

sym_phi_dot_val = diff(sym_phi_val,t);
the1_dot_val = diff(the1_val,t);
the2_dot_val = diff(the2_val,t);
the_a_dot_val = diff(the_a_val,t);
sym_Q_dot_val = diff(sym_Q_val,t);


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
    (sym_Q_dot*0.5*(l1 - l2)*cos(sym_phi))^2) + (1/2)*Iyy7*the2_dot^2 + (1/2)*Ixx7*the_a_dot^2;


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

% Derivates wrt q and q_dot
dL_dphi  =  deriv(Lagrag,'sym_phi');
dL_dthe1  =  deriv(Lagrag,'the1');
dL_dthe2  =  deriv(Lagrag,'the2');
dL_dthe_a =  deriv(Lagrag,'the_a');
dL_dQ     =  deriv(Lagrag,'sym_Q');

dL_dphi_do  = deriv(Lagrag,'sym_phi_dot');
dL_dthe1_dot  = deriv(Lagrag,'the1_dot');
dL_dthe2_dot  = deriv(Lagrag,'the2_dot');
dL_dthe_a_dot = deriv(Lagrag,'the_a_dot');
dL_dQ_dot      = deriv(Lagrag,'sym_Q_dot');


% Derivatives now function of time
dL_dphi = subs(dL_dphi, [sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
    [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val, sym_Q_val, sym_Q_dot_val]);
dL_dthe1 = subs(dL_dthe1, [sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
    [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val, sym_Q_val, sym_Q_dot_val]);
dL_dthe2 = subs(dL_dthe2, [sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
    [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val, sym_Q_val, sym_Q_dot_val]);
dL_dthe_a = subs(dL_dthe_a, [sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
    [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val, sym_Q_val, sym_Q_dot_val]);
dL_dQ  = subs(dL_dQ , [sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
    [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val, sym_Q_val, sym_Q_dot_val]);
dL_dphi_dot = subs(dL_dphi_do, [sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
    [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val, sym_Q_val, sym_Q_dot_val]);
dL_dthe1_dot = subs(dL_dthe1_dot, [sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
    [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val, sym_Q_val, sym_Q_dot_val]);
dL_dthe2_dot = subs(dL_dthe2_dot, [sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
    [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val, sym_Q_val, sym_Q_dot_val]);
dL_dthe_a_dot = subs(dL_dthe_a_dot, [sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
    [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val, sym_Q_val, sym_Q_dot_val]);
dL_dQ_dot = subs(dL_dQ_dot, [sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
    [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val, sym_Q_val, sym_Q_dot_val]);


%%
dL_dq_1 = [dL_dphi, dL_dthe1, dL_dthe2, dL_dthe_a, dL_dQ]';
dL_dq =   eval(subs(dL_dq_1, t, t_val))



%%
% % Derivative wrt time
% ddL_dphi_dot_dt = deriv(dL_dphi_dot, 't');
% ddL_dthe1_dot_dt = deriv(dL_dthe1_dot, 't');
% ddL_dthe2_dot_dt = deriv(dL_dthe2_dot, 't');
% ddL_dthe_a_dot_dt = deriv(dL_dthe_a_dot, 't');
% ddL_dQ_dot_dt = deriv(dL_dQ_dot, 't');
% 
% 
% %% Equations
% dL_dq = [dL_dphi, dL_dthe1, dL_dthe2, dL_dthe_a, dL_dQ]';
% ddL_dq_dt = [ddL_dphi_dot_dt, ddL_dthe1_dot_dt, ddL_dthe2_dot_dt, ddL_dthe_a_dot_dt, ddL_dQ_dot_dt]';
% 
% sym_tau = ddL_dq_dt - dL_dq;
% 
% % tau =   eval(subs(sym_tau, t, t_val));
% 
% torque = [tau(4),tau(5), tau(3), 0, tau(2), 0, 0, 0, 0, 0, tau(1),tau(5)]';
torque = [1,1,1,1];
end
