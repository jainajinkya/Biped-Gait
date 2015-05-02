function [KE, PE] = energy(t_val)
%syms sym_phi sym_phi_dot the1 the1_dot the2 the2_dot the_a the_a_dot sym_Q sym_Q_dot t t1
syms l1 l2 l3 l4 l5 h w m1 m2 m3 m4 m5 m6 m7
syms t t1

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

% sym_phi_dot_val = diff(sym_phi_val,t);
% the1_dot_val = diff(the1_val,t);
% the2_dot_val = diff(the2_val,t);
% the_a_dot_val = diff(the_a_val,t);
% sym_Q_dot_val = diff(sym_Q_val,t1);


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

if(rem(floor(t_val/tm),2) == 0)
    I1 = (m1/12)*[l4^2 + h^2, 0 ,0; 0, l3^2 + h^2, 0; 0, 0, l3^2 + l4^2];
    I2 = (m2/12)*[w^2 + h^2, 0 ,0; 0, l1^2 + h^2, 0; 0, 0, l1^2 + w^2];
    I3 = (m3/12)*[w^2 + h^2, 0 ,0; 0, l2^2 + h^2, 0; 0, 0, l2^2 + w^2];
    I4 = (m4/12)*[w^2 + h^2, 0 ,0; 0, l5^2 + h^2, 0; 0, 0, l5^2 + w^2];
    I5 = (m5/12)*[w^2 + h^2, 0 ,0; 0, l2^2 + h^2, 0; 0, 0, l2^2 + w^2];
    I6 = (m6/12)*[w^2 + h^2, 0 ,0; 0, l1^2 + h^2, 0; 0, 0, l1^2 + w^2];
    I7 = (m7/12)*[l4^2 + h^2, 0 ,0; 0, l3^2 + h^2, 0; 0, 0, l3^2 + l4^2];
    
    wm7 = [sym_Q_dot; sym_phi_dot+the1_dot+the2_dot+the_a_dot; 0];
    wm6 = [sym_Q_dot; sym_phi_dot+the1_dot+the2_dot; 0];
    wm5 = [sym_Q_dot; sym_phi_dot+the1_dot; 0];
    wm4 = [0; 0; 0];
    wm3 = [sym_Q_dot; sym_phi_dot; 0];
    wm2 = [sym_Q_dot; sym_phi_dot; 0];
    wm1 = [0; 0; 0];
    
    %% Kinetic Energies
    KE1 = 0;
    KE2 = (0.5)*m2*((sym_phi_dot*l1*0.5)^2 + (sym_Q_dot*l1*0.5*cos(sym_phi))^2) + (1/2)*wm2(1)*I2(1,1)*wm2(1) + (1/2)*wm2(2)*I2(2,2)*wm2(2);
    KE3 = (0.5)*m3*((sym_phi_dot*(l1 + l2*0.5))^2 + (sym_Q_dot*(l1 + l2*0.5)*cos(sym_phi))^2) + (1/2)*wm3(1)*I3(1,1)*wm3(1) + (1/2)*wm3(2)*I3(2,2)*wm3(2);
    KE4 = (0.5)*m4*((sym_phi_dot*(l1 + l2))^2 + (sym_Q_dot*(l1 + l2)*cos(sym_phi))^2) + (1/2)*wm4(1)*I4(1,1)*wm4(1) + (1/2)*wm4(2)*I4(2,2)*wm4(2);
    KE5 = (0.5)*m5*((sym_phi_dot*(l1 + l2)*cos(sym_phi) + the1_dot*l2*0.5*cos(the1))^2 + (sym_phi_dot*(l1 + l2)*sin(sym_phi) + the1_dot*l2*0.5*sin(the1))^2 ...
        +(sym_Q_dot*(l1 + l2/2)*cos(sym_phi))^2) + (1/2)*wm5(1)*I5(1,1)*wm5(1) + (1/2)*wm5(2)*I5(2,2)*wm5(2);
    KE6 = (0.5)*m6*((sym_phi_dot*(l1 + l2)*cos(sym_phi) + the1_dot*l2*0.5*cos(the1)+ the2_dot*l1*0.5*cos(the2))^2 + ...
        (sym_phi_dot*(l1 + l2)*sin(sym_phi) + the1_dot*l2*0.5*sin(the1)+ the2_dot*l1*0.5*sin(the2))^2 +...
        (sym_Q_dot*0.5*(l1 - l2)*cos(sym_phi))^2) + (1/2)*wm6(1)*I6(1,1)*wm6(1) + (1/2)*wm6(2)*I6(2,2)*wm6(2);
    KE7 = (0.5)*m7*((sym_phi_dot*(l1 + l2)*cos(sym_phi) + the1_dot*l2*0.5*cos(the1)+ the2_dot*l1*0.5*cos(the2) + the_a_dot*0.5*l3*cos(the_a))^2 + ...
        (sym_phi_dot*(l1 + l2)*sin(sym_phi) + the1_dot*l2*0.5*sin(the1)+ the2_dot*l1*0.5*sin(the2) + the_a_dot*0.5*l3*sin(the_a))^2 +...
        (sym_Q_dot*0.5*(l1 - l2)*cos(sym_phi))^2) + (1/2)*wm7(1)*I7(1,1)*wm7(1) + (1/2)*wm7(2)*I7(2,2)*wm7(2);
    
    KE = (KE1 + KE2 + KE3 + KE4 + KE5 + KE6 + KE7);
    
    
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
    
elseif(rem(floor(t_val/tm),2) == 1)
    I7 = (m1/12)*[l4^2 + h^2, 0 ,0; 0, l3^2 + h^2, 0; 0, 0, l3^2 + l4^2];
    I6 = (m2/12)*[w^2 + h^2, 0 ,0; 0, l1^2 + h^2, 0; 0, 0, l1^2 + w^2];
    I5 = (m3/12)*[w^2 + h^2, 0 ,0; 0, l2^2 + h^2, 0; 0, 0, l2^2 + w^2];
    I4 = (m4/12)*[w^2 + h^2, 0 ,0; 0, l5^2 + h^2, 0; 0, 0, l5^2 + w^2];
    I3 = (m5/12)*[w^2 + h^2, 0 ,0; 0, l2^2 + h^2, 0; 0, 0, l2^2 + w^2];
    I2 = (m6/12)*[w^2 + h^2, 0 ,0; 0, l1^2 + h^2, 0; 0, 0, l1^2 + w^2];
    I1 = (m7/12)*[l4^2 + h^2, 0 ,0; 0, l3^2 + h^2, 0; 0, 0, l3^2 + l4^2];
    
    wm1 = [sym_Q_dot; sym_phi_dot+the1_dot+the2_dot+the_a_dot; 0];
    wm2 = [sym_Q_dot; sym_phi_dot+the1_dot+the2_dot; 0];
    wm3 = [sym_Q_dot; sym_phi_dot+the1_dot; 0];
    wm4 = [0; 0; 0];
    wm5 = [sym_Q_dot; sym_phi_dot; 0];
    wm6 = [sym_Q_dot; sym_phi_dot; 0];
    wm7 = [0; 0; 0];
    
    %% Kinetic Energies
    KE7 = 0;
    KE6 = (0.5)*m6*((sym_phi_dot*l1*0.5)^2 + (sym_Q_dot*l1*0.5*cos(sym_phi))^2) + (1/2)*wm6(1)*I6(1,1)*wm6(1) + (1/2)*wm6(2)*I6(2,2)*wm6(2);
    KE5 = (0.5)*m5*((sym_phi_dot*(l1 + l2*0.5))^2 + (sym_Q_dot*(l1 + l2*0.5)*cos(sym_phi))^2) + (1/2)*wm5(1)*I5(1,1)*wm5(1) + (1/2)*wm5(2)*I5(2,2)*wm5(2);
    KE4 = (0.5)*m4*((sym_phi_dot*(l1 + l2))^2 + (sym_Q_dot*(l1 + l2)*cos(sym_phi))^2) + (1/2)*wm4(1)*I4(1,1)*wm4(1) + (1/2)*wm4(2)*I4(2,2)*wm4(2);
    KE3 = (0.5)*m3*((sym_phi_dot*(l1 + l2)*cos(sym_phi) + the1_dot*l2*0.5*cos(the1))^2 + (sym_phi_dot*(l1 + l2)*sin(sym_phi) + the1_dot*l2*0.5*sin(the1))^2 ...
        +(sym_Q_dot*(l1 + l2/2)*cos(sym_phi))^2) + (1/2)*wm3(1)*I3(1,1)*wm3(1) + (1/2)*wm3(2)*I3(2,2)*wm3(2);
    KE2 = (0.5)*m3*((sym_phi_dot*(l1 + l2)*cos(sym_phi) + the1_dot*l2*0.5*cos(the1)+ the2_dot*l1*0.5*cos(the2))^2 + ...
        (sym_phi_dot*(l1 + l2)*sin(sym_phi) + the1_dot*l2*0.5*sin(the1)+ the2_dot*l1*0.5*sin(the2))^2 +...
        (sym_Q_dot*0.5*(l1 - l2)*cos(sym_phi))^2) + (1/2)*wm2(1)*I2(1,1)*wm2(1) + (1/2)*wm2(2)*I2(2,2)*wm2(2);
    KE1 = (0.5)*m1*((sym_phi_dot*(l1 + l2)*cos(sym_phi) + the1_dot*l2*0.5*cos(the1)+ the2_dot*l1*0.5*cos(the2) + the_a_dot*0.5*l3*cos(the_a))^2 + ...
        (sym_phi_dot*(l1 + l2)*sin(sym_phi) + the1_dot*l2*0.5*sin(the1)+ the2_dot*l1*0.5*sin(the2) + the_a_dot*0.5*l3*sin(the_a))^2 +...
        (sym_Q_dot*0.5*(l1 - l2)*cos(sym_phi))^2) + (1/2)*wm1(1)*I1(1,1)*wm1(1) + (1/2)*wm1(2)*I1(2,2)*wm1(2);
    
    KE = (KE1 + KE2 + KE3 + KE4 + KE5 + KE6 + KE7);
    
    
    % KE = subs(KE,[sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
    %     [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val,sym_Q_val, sym_Q_dot_val]);
    % KE = subs(KE, t, t_val - floor(t_val/tm)*tm);
    % KE = subs(KE, t1 , t_val - floor(t_val/(2*tm))*2*tm);
    % KE = eval(KE);
    
    %% Potential Energies
    PE7 = 0;
    PE6 = m2*g*l1*0.5*cos(sym_phi);
    PE5 = m3*g*(l1+l2*0.5)*cos(sym_phi);
    PE4 = m4*g*(l1+l2)*cos(sym_phi);
    PE3 = m5*g*((l1+l2)*cos(sym_phi) - l2*0.5*cos(the1));
    PE2 = m6*g*((l1+l2)*cos(sym_phi) - l2*cos(the1) - l1*0.5*cos(the2));
    PE1 = m7*g*((l1+l2)*cos(sym_phi) - l2*cos(the1) - l1*cos(the2) - l3*0.5*cos(the_a));
    
    PE = (PE1 + PE2 + PE3 + PE4 + PE5 + PE6+ PE7);
    
    % PE = subs(PE,[sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
    %     [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val,sym_Q_val, sym_Q_dot_val]);
    % PE = subs(PE, t, t_val - floor(t_val/tm)*tm);
    % PE = subs(PE, t1 , t_val - floor(t_val/(2*tm))*2*tm);
    % PE = eval(PE);
    
end

end