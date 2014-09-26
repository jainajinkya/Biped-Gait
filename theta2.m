function theta2_val = theta2(t,theta1_max,theta2_max)

global tm td

% if(t<=td/2 || (t>tm && t<=(tm+td/2)))
if(t<=td/2)
    theta2_val = 2*(theta1_max-theta2_max)*(t/td)  - theta1_max;
    
% elseif(((t>(tm-td/2))&&(t<=tm))||((t>(2*tm-td/2))&&(t<=2*tm)))
elseif((t>(tm-td/2))&&(t<=tm))
    theta2_val = theta1_max;
    
else
    a0 = (td^3*theta1_max - td^3*theta2_max + 4*theta1_max*tm^3 - 8*td*theta1_max*tm^2 + 2*td^2*theta1_max*tm - 4*td*theta2_max*tm^2 + 4*td^2*theta2_max*tm)/(4*(td - tm)*(td^2 - 2*td*tm + tm^2));
    a1 = -(4*td^3*theta1_max + 2*td^3*theta2_max + 4*theta1_max*tm^3 - 4*theta2_max*tm^3 - 4*td*theta1_max*tm^2 - 7*td^2*theta1_max*tm + 4*td*theta2_max*tm^2 - 5*td^2*theta2_max*tm)/(2*td*(td - tm)*(td^2 - 2*td*tm + tm^2));
    a2 = (td^2*theta1_max - td^2*theta2_max + 4*theta1_max*tm^2 - 4*theta2_max*tm^2 - 8*td*theta1_max*tm + 2*td*theta2_max*tm)/(td*(td - tm)*(td^2 - 2*td*tm + tm^2));
    a3 = (2*(2*td*theta1_max - theta1_max*tm + theta2_max*tm))/(td*(td - tm)*(td^2 - 2*td*tm + tm^2));
    
    theta2_val = a0 + a1*t + a2*t^2 + a3*t^3;
    
end

end