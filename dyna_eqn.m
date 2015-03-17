%% Dynamical Equation Development

syms phi phi_dot the1 te_dot the2 the2_dot the_a the_a_dot Q Q_dot
m1 = 
m2 =
m3 = 
m4 = 
m5 = 
m6 = 
m7 = 

l1 = 0.45;
l2 = 0.45;
l3 = 0.15;
l4 = 0.1;
l5 = 0.4;

Ixx2 = (1/12)*m2*l1^2*(cos(phi))^2;
Ixx3 = (1/12)*m3*l2^2*(cos(phi))^2;
Ixx4 = (1/12)*m4*l5^2;
Ixx5 = (1/12)*m5*l2^2*(cos(the1))^2;
Ixx6 = (1/12)*m6*l1^2*(cos(the2))^2;
Ixx7 = (1/12)*m7*l3^2*(cos(the_a))^2;
Iyy2 = (1/12)*m2*l1^2*(cos(Q))^2;
Iyy3 = (1/12)*m3*l2^2*(cos(Q))^2;
Iyy4 = 0;
Iyy5 = (1/12)*m5*l2^2*(cos(Q))^2;
Iyy6 = (1/12)*m6*l1^2*(cos(Q))^2;
Iyy7 = (1/12)*m7*l3^2;


KE1 = 0;
KE2 = (0.5)*m2*((phi_dot*l1*0.5)^2 + (Q_dot*l1*0.5*cos(phi))^2) + (1/2)*Iyy2*phi_dot^2 + (1/2)*Ixx2*Q_dot^2;
KE3 = (0.5)*m3*((phi_dot*(l1 + l2*0.5))^2 + (Q_dot*(l1 + l2*0.5)*cos(phi))^2) + (1/2)*Iyy3*phi_dot^2 + (1/2)*Ixx3*Q_dot^2;
KE4 = (0.5)*m4*((phi_dot*(l1 + l2))^2 + (Q_dot*(l1 + l2)*cos(phi))^2) + (1/2)*Iyy4*phi_dot^2 + (1/2)*Ixx4*Q_dot^2;
KE5 = (0.5)*m5*((phi_dot*(l1 + l2)*cos(phi) + the1_dot*l2*0.5*cos(the1))^2 + (phi_dot*(l1 + l2)*sin(phi) + the1_dot*l2*0.5*sin(the1))^2 ...
    +(Q_dot*(l1 + l2)*cos(phi))^2) + (1/2)*Iyy5*phi_dot^2 + (1/2)*Ixx5*Q_dot^2);

