function theta_a_val = theta_a(t)

global td tm theta_a_min
t = t - floor(t/tm)*tm ;
if(t<=td/2)
    a0 = pi/2;
    a1 = 0 ;
    a2 = -12*(pi/2 - theta_a_min)/td^2;
    a3 = 16*(pi/2 - theta_a_min)/td^3;
    
elseif(t>td/2 && t<=(tm-td/2))
    a0 = -(4*theta_a_min*tm^3 - 2*pi*td^3 - 12*td*theta_a_min*tm^2 + 6*td^2*theta_a_min*tm + 3*pi*td^2*tm)/(4*(td - tm)*(td^2 - 2*td*tm + tm^2));
    a1 = -(3*(pi*td^2 - 2*td^2*theta_a_min - 2*pi*td*tm + 4*td*theta_a_min*tm))/(2*(td - tm)*(td^2 - 2*td*tm + tm^2));
    a2 = -(3*(pi*tm - 2*theta_a_min*tm))/((td - tm)*(td^2 - 2*td*tm + tm^2));
    a3 = (2*(pi - 2*theta_a_min))/((td - tm)*(td^2 - 2*td*tm + tm^2));
    
else
    a0 = (pi*td^3 - 16*pi*tm^3 + 32*theta_a_min*tm^3 - 24*td*theta_a_min*tm^2 + 12*pi*td*tm^2)/(2*td^3);
    a1 = (12*(2*pi*tm^2 - 4*theta_a_min*tm^2 - pi*td*tm + 2*td*theta_a_min*tm))/td^3;
    a2 = (6*(pi*td - 4*pi*tm - 2*td*theta_a_min + 8*theta_a_min*tm))/td^3;
    a3 = (8*(pi - 2*theta_a_min))/td^3 ;
end

theta_a_val = a0 + a1*t + a2*t^2 + a3*t^3;

end