function [KE, PE] = energy(t_val)
%%% Curretn Issue: The sym_phi and other angles are getting negative values
%%% in the function. Check this values
%syms sym_phi sym_phi_dot the1 the1_dot the2 the2_dot the_a the_a_dot sym_Q sym_Q_dot t t1
syms l1 l2 l3 l4 l5 m1 m2 m3 m4 m5 m6 m7 t t1

global tm
%

sym_phi = sym('sym_phi(t)');
the1 = sym('theta1(t)');
the2 = sym('theta2(t)');
the_a = sym('theta_a(t)');
sym_Q = sym('Q(t1)');

sym_phi_dot = (diff(sym_phi,t));
the1_dot = (diff(the1,t));
the2_dot = (diff(the2,t));
the_a_dot = (diff(the_a,t));
sym_Q_dot = (diff(sym_Q,t1));

sym_phi_val = phi(t_val,'char');
the1_val = theta1(t_val,'char');
the2_val = theta2(t_val,'char');
the_a_val = theta_a(t_val,'char');
sym_Q_val = Q(t_val,'char');

sym_phi_dot_val = diff(sym_phi_val,t);
the1_dot_val = diff(the1_val,t);
the2_dot_val = diff(the2_val,t);
the_a_dot_val = diff(the_a_val,t);
sym_Q_dot_val = diff(sym_Q_val,t1);


g = 9.8;

%% Dimensions
% l1 = 0.45;
% l2 = 0.45;
% l3 = 0.15;
% l4 = 0.1;
% l5 = 0.4;
% 
% %% Masses
% m1 = 10.5;
% m2 = 2.8;
% m3 = 1;
% m4 = 43;
% m5 = 10.5;
% m6 = 2.8;
% m7 = 1;

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
    +(sym_Q_dot*(l1 + l2/2)*cos(sym_phi))^2) + (1/2)*Iyy5*the1_dot^2 + (1/2)*Ixx5*sym_Q_dot^2;
KE6 = (0.5)*m6*((sym_phi_dot*(l1 + l2)*cos(sym_phi) + the1_dot*l2*0.5*cos(the1)+ the2_dot*l1*0.5*cos(the2))^2 + ...
    (sym_phi_dot*(l1 + l2)*sin(sym_phi) + the1_dot*l2*0.5*sin(the1)+ the2_dot*l1*0.5*sin(the2))^2 +...
    (sym_Q_dot*0.5*(l1 - l2)*cos(sym_phi))^2) + (1/2)*Iyy6*the2_dot^2 + (1/2)*Ixx6*sym_Q_dot^2;
KE7 = (0.5)*m7*((sym_phi_dot*(l1 + l2)*cos(sym_phi) + the1_dot*l2*0.5*cos(the1)+ the2_dot*l1*0.5*cos(the2) + the_a_dot*0.5*l3*cos(the_a))^2 + ...
    (sym_phi_dot*(l1 + l2)*sin(sym_phi) + the1_dot*l2*0.5*sin(the1)+ the2_dot*l1*0.5*sin(the2) + the_a_dot*0.5*l3*sin(the_a))^2 +...
    (sym_Q_dot*0.5*(l1 - l2)*cos(sym_phi))^2) + (1/2)*Iyy7*the_a_dot^2;

KE = (KE1 + KE2 + KE3 + KE4 + KE5 + KE6 + KE7);


% % KE_1 = subs(KE, [sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
% %     [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val, sym_Q_val, sym_Q_dot_val])
% % KE_2 =   eval(subs(KE_1, t, t_val))
% KE = subs(KE,[sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
%     [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val,sym_Q_val, sym_Q_dot_val]);
% KE = subs(KE, t, t_val - floor(t_val/tm)*tm);
% KE = subs(KE, t1 , t_val - floor(t_val/(2*tm))*2*tm);
% KE = eval(KE);

%% Potential Energies
PE1 = 0;
PE2 = m2*g*l1*0.5*cos(sym_phi);
PE3 = m3*g*(l1+l2*0.5)*cos(sym_phi);
PE4 = m4*g*(l1+l2)*cos(sym_phi);
PE5 = m5*g*((l1+l2)*cos(sym_phi) - l2*0.5*cos(the1));
PE6 = m6*g*((l1+l2)*cos(sym_phi) - l2*cos(the1) - l1*0.5*cos(the2));
PE7 = m7*g*((l1+l2)*cos(sym_phi) - l2*cos(the1) - l1*cos(the2) - l3*0.5*cos(the_a));

PE = (PE1 + PE2 + PE3 + PE4 + PE5 + PE6+ PE7);

% PE = subs(PE,[sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
%     [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val,sym_Q_val, sym_Q_dot_val]);
% PE = subs(PE, t, t_val - floor(t_val/tm)*tm);
% PE = subs(PE, t1 , t_val - floor(t_val/(2*tm))*2*tm);
% PE = eval(PE);


% % PE_1 = subs(PE2, sym_phi, sym_phi_val);
% % 
% % PE_2 =   eval(subs(PE_1, t, t_val));
% % 
% % KE = eval(subs((sym_Q_val),t1,t_val - floor(t_val/(2*tm))*(2*tm)));
% % KE = eval(subs(the_a_val, t, t_val - floor(t_val/tm)*tm));
end