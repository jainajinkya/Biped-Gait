function maxParameters(Ls,Hvel)

global l1 l2 l3 l4 l5 tm td x_e Vc phi_max theta1_max theta2_max Qmax % List of all Parameters used in the workspace

phi_max = asin(Ls/(2*(l1+l2)));

theta1_max = 0.5*Hvel*(tm-td);

theta2_max = asin((Ls + (l1+l2)*abs(sin(phi_max)) - l1*sin(theta1_max))/l2);

Vc = Ls/tm ; 

end