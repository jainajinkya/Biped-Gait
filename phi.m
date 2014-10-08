function phi_val = phi(t)

global l1 l2 tm Vc phi_max
a0 = phi_max;
a1 = 0;
a2 = -6*phi_max/tm^2;
a3 = 4*phi_max/tm^3;

phi_val = a0 + a1*t + a2*t^2 + a3*t^3;

end