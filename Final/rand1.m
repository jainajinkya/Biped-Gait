function [PE7] = rand1()
syms phi phi_dot theta_1 theta_1_dot theta_2 theta_2_dot the_a theta_a_dot Q Q_dot t t1
% syms l_1 l_2 l_3 l_4 l_5 h w m_1 m_2 m_3 m_4 m_5 m_6 m_7
syms t t1

syms l_1 l_2 l_3 l_4 l_5 t_m h w
syms m_1 m_2 m_3 m_4 m_5 m_6 m_7
%

% phi = sym('phi(t)');
% theta_1 = sym('theta1(t)');
% theta_2 = sym('theta2(t)');
% the_a = sym('theta_a(t)');
% Q = sym('Q(t1)');
%
% phi_dot = (diff(phi,t));
% theta_1_dot = (diff(theta_1,t));
% theta_2_dot = (diff(theta_2,t));
% theta_a_dot = (diff(the_a,t));
% Q_dot = (diff(Q,t1));
%
% phi_val = phi(t_val,'char');
% theta_1_val = theta1(t_val,'char');
% theta_2_val = theta2(t_val,'char');
% the_a_val = theta_a(t_val,'char');
% Q_val = Q(t_val,'char');
%
% phi_dot_val = diff(phi_val,t);
% theta_1_dot_val = diff(theta_1_val,t);
% theta_2_dot_val = diff(theta_2_val,t);
% theta_a_dot_val = diff(the_a_val,t);
% Q_dot_val = diff(Q_val,t1);


g = 9.8;

% %% Dimensions
% l_1 = 0.45;
% l_2 = 0.45;
% l_3 = 0.15;
% l_4 = 0.1;
% l_5 = 0.4;
%
% %% Masses
% m_1 = 10.5;
% m_2 = 2.8;
% m_3 = 1;
% m_4 = 43;
% m_5 = 10.5;
% m_6 = 2.8;
% m_7 = 1;

%% Moments of Inertias


I1 = (m_1/12)*[l_4^2 + h^2, 0 ,0; 0, l_3^2 + h^2, 0; 0, 0, l_3^2 + l_4^2];
I2 = (m_2/12)*[w^2 + h^2, 0 ,0; 0, l_1^2 + h^2, 0; 0, 0, l_1^2 + w^2];
I3 = (m_3/12)*[w^2 + h^2, 0 ,0; 0, l_2^2 + h^2, 0; 0, 0, l_2^2 + w^2];
I4 = (m_4/12)*[w^2 + h^2, 0 ,0; 0, l_5^2 + h^2, 0; 0, 0, l_5^2 + w^2];
I5 = (m_5/12)*[w^2 + h^2, 0 ,0; 0, l_2^2 + h^2, 0; 0, 0, l_2^2 + w^2];
I6 = (m_6/12)*[w^2 + h^2, 0 ,0; 0, l_1^2 + h^2, 0; 0, 0, l_1^2 + w^2];
I7 = (m_7/12)*[l_4^2 + h^2, 0 ,0; 0, l_3^2 + h^2, 0; 0, 0, l_3^2 + l_4^2];

wm_7 = [Q_dot; phi_dot+theta_1_dot+theta_2_dot+theta_a_dot; 0];
wm_6 = [Q_dot; phi_dot+theta_1_dot+theta_2_dot; 0];
wm_5 = [Q_dot; phi_dot+theta_1_dot; 0];
wm_4 = [0; 0; 0];
wm_3 = [Q_dot; phi_dot; 0];
wm_2 = [Q_dot; phi_dot; 0];
wm_1 = [0; 0; 0];

%% Kinetic Energies

KE1 = 0;
KE2 = (0.5)*m_2*((phi_dot*l_1*0.5)^2 + (Q_dot*l_1*0.5*cos(phi))^2) + (1/2)*wm_2(1)*I2(1,1)*wm_2(1) + (1/2)*wm_2(2)*I2(2,2)*wm_2(2);
KE3 = (0.5)*m_3*((phi_dot*(l_1 + l_2*0.5))^2 + (Q_dot*(l_1 + l_2*0.5)*cos(phi))^2) + (1/2)*wm_3(1)*I3(1,1)*wm_3(1) + (1/2)*wm_3(2)*I3(2,2)*wm_3(2);
KE4 = (0.5)*m_4*((phi_dot*(l_1 + l_2))^2 + (Q_dot*(l_1 + l_2)*cos(phi))^2) + (1/2)*wm_4(1)*I4(1,1)*wm_4(1) + (1/2)*wm_4(2)*I4(2,2)*wm_4(2);
KE5 = (0.5)*m_5*((phi_dot*(l_1 + l_2)*cos(phi) + theta_1_dot*l_2*0.5*cos(theta_1))^2 + (phi_dot*(l_1 + l_2)*sin(phi) + theta_1_dot*l_2*0.5*sin(theta_1))^2 ...
    +(Q_dot*(l_1 + l_2/2)*cos(phi))^2) + (1/2)*wm_5(1)*I5(1,1)*wm_5(1) + (1/2)*wm_5(2)*I5(2,2)*wm_5(2);
KE6 = (0.5)*m_6*((phi_dot*(l_1 + l_2)*cos(phi) + theta_1_dot*l_2*0.5*cos(theta_1)+ theta_2_dot*l_1*0.5*cos(theta_2))^2 + ...
    (phi_dot*(l_1 + l_2)*sin(phi) + theta_1_dot*l_2*0.5*sin(theta_1)+ theta_2_dot*l_1*0.5*sin(theta_2))^2 +...
    (Q_dot*0.5*(l_1 - l_2)*cos(phi))^2) + (1/2)*wm_6(1)*I6(1,1)*wm_6(1) + (1/2)*wm_6(2)*I6(2,2)*wm_6(2);
KE7 = (0.5)*m_7*((phi_dot*(l_1 + l_2)*cos(phi) + theta_1_dot*l_2*0.5*cos(theta_1)+ theta_2_dot*l_1*0.5*cos(theta_2) + theta_a_dot*0.5*l_3*cos(the_a))^2 + ...
    (phi_dot*(l_1 + l_2)*sin(phi) + theta_1_dot*l_2*0.5*sin(theta_1)+ theta_2_dot*l_1*0.5*sin(theta_2) + theta_a_dot*0.5*l_3*sin(the_a))^2 +...
    (Q_dot*0.5*(l_1 - l_2)*cos(phi))^2) + (1/2)*wm_7(1)*I7(1,1)*wm_7(1) + (1/2)*wm_7(2)*I7(2,2)*wm_7(2);

KE = eval(simplify(KE1 + KE2 + KE3 + KE4 + KE5 + KE6 + KE7));


%     KE = subs(KE,[phi, phi_dot, theta_1, theta_1_dot, theta_2, theta_2_dot, the_a, theta_a_dot, Q, Q_dot], ...
%         [phi_val, phi_dot_val, theta_1_val, theta_1_dot_val, theta_2_val, theta_2_dot_val, the_a_val, theta_a_dot_val,Q_val, Q_dot_val]);
%     KE = subs(KE, t, t_val - floor(t_val/t_m)*t_m);
%     KE = subs(KE, t1 , t_val - floor(t_val/(2*t_m))*2*t_m);
%     KE = eval(KE);

%% Potential Energies
PE1 = 0;
PE2 = m_2*g*l_1*0.5*cos(phi);
PE3 = m_3*g*(l_1+l_2*0.5)*cos(phi);
PE4 = m_4*g*(l_1+l_2)*cos(phi);
PE5 = m_5*g*((l_1+l_2)*cos(phi) - l_2*0.5*cos(theta_1));
PE6 = m_6*g*((l_1+l_2)*cos(phi) - l_2*cos(theta_1) - l_1*0.5*cos(theta_2));
PE7 = m_7*g*((l_1+l_2)*cos(phi) - l_2*cos(theta_1) - l_1*cos(theta_2) - l_3*0.5*cos(the_a));

PE = eval(PE1 + PE2 + PE3 + PE4 + PE5 + PE6+ PE7);

%     PE = subs(PE,[phi, phi_dot, theta_1, theta_1_dot, theta_2, theta_2_dot, the_a, theta_a_dot, Q, Q_dot], ...
%         [phi_val, phi_dot_val, theta_1_val, theta_1_dot_val, theta_2_val, theta_2_dot_val, the_a_val, theta_a_dot_val,Q_val, Q_dot_val]);
%     PE = subs(PE, t, t_val - floor(t_val/t_m)*t_m);
%     PE = subs(PE, t1 , t_val - floor(t_val/(2*t_m))*2*t_m);
%     PE = eval(PE);
% KE = latex(KE);
% PE = latex(PE);
end