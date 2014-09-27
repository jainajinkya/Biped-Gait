function phi_val = phi(t)

global l1 l2 tm Vc phi_max
a0 = phi_max;
a1 = Vc/((l1+l2)*cos(phi_max));
a2 = (-3/tm^2)*((Vc*tm)/((l1+l2)*cos(phi_max)) + 2*phi_max);
a3 = (2/tm^3)*((Vc*tm)/((l1+l2)*cos(phi_max)) + 2*phi_max);

phi_val = a0 + a1*t + a2*t^2 + a3*t^3;

end