function maxParameters()

global l1 l2 l3 l4 l5 tm td Ls x_ori Vc phi_max theta1_max theta2_max theta_a_min Q_max % List of all Parameters used in the workspace

Vc = Ls/tm ; 

phi_max = asin(Ls/(2*(l1+l2)));

theta1_max = phi_max;
% theta1_max = 0.5*Hvel*(tm-td);

phi_d = phi(td);
A = 2*l1*((l1+l2)*cos(phi_d) - l2*cos(theta1_max));
B = 2*l1*(l3 + (l1+l2)*sin(phi_max) + l2*sin(theta1_max) - Ls);
C = l1^2 + ((l1+l2)*cos(phi_d) - l2*cos(theta1_max))^2 + (l3 + (l1+l2)*sin(phi_max) + l2*sin(theta1_max) - Ls)^2 - l3^2;

P = atan2(B,A);
theta2_max = P + acos(C/sqrt(A^2 + B^2));

theta_a_min = acos((x_ori(3)+(l1+l2)*cos(phi_d) - l2*cos(theta1_max) - l1*cos(theta2_max))/l3);

Q_max = pi/24 ;
end