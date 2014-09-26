function [phi_max,theta1_max,theta2_max,Q1_max, Vc] = maxParameters(Ls, Hvel,Q_max)

global l1 l2 l3 l4 l5 tm td x_e

Q1_max = Q_max;

phi_max = asin(Ls/(2*(l1+l2)));

theta1_max = 0.5*Hvel*(tm-td);

theta2_max = asin((Ls - (l1+l2)*abs(sin(phi_max)) - l1*sin(theta1_max))/l2);

Vc = Ls/tm ; 

end