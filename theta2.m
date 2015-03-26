function theta2_val = theta2(t)

global tm td theta1_max theta2_max

if(strcmp(class(t),'sym'))
    syms a0 a1 a2 a3
    theta2_val = a0 + a1*t + a2*t^2 + a3*t^3;
    
else
    t = t - floor(t/tm)*tm ;

    if(t<=td/2)
    a0 = 2*(theta1_max-theta2_max)*(t/td)  - theta1_max;
    a1 = 0;
    a2 = 0;
    a3 = 0;
    
elseif((t>(tm-td/2))&&(t<=tm))
    a0 = theta1_max;
    a1 = 0;
    a2 = 0;
    a3 = 0;
    
else
    a0 = (td^3*theta1_max - td^3*theta2_max + 4*theta1_max*tm^3 - 8*td*theta1_max*tm^2 + 2*td^2*theta1_max*tm - 4*td*theta2_max*tm^2 + 4*td^2*theta2_max*tm)/(4*(td - tm)*(td^2 - 2*td*tm + tm^2));
    a1 = -(4*td^3*theta1_max + 2*td^3*theta2_max + 4*theta1_max*tm^3 - 4*theta2_max*tm^3 - 4*td*theta1_max*tm^2 - 7*td^2*theta1_max*tm + 4*td*theta2_max*tm^2 - 5*td^2*theta2_max*tm)/(2*td*(td - tm)*(td^2 - 2*td*tm + tm^2));
    a2 = (td^2*theta1_max - td^2*theta2_max + 4*theta1_max*tm^2 - 4*theta2_max*tm^2 - 8*td*theta1_max*tm + 2*td*theta2_max*tm)/(td*(td - tm)*(td^2 - 2*td*tm + tm^2));
    a3 = (2*(2*td*theta1_max - theta1_max*tm + theta2_max*tm))/(td*(td - tm)*(td^2 - 2*td*tm + tm^2));
end

theta2_val = a0 + a1*t + a2*t^2 + a3*t^3;
end
end