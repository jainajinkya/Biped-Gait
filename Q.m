function Q_val = Q(t)
global td tm Q_max

t = t - floor(t/tm)*tm ;

if(t<=td/2)
    a0 = 0;
    a1 = -(3*Q_max)/td;
    a2 = 0;
    a3 = (4*Q_max)/td^3;
    Q_val = a0 + a1*t + a2*t^2 + a3*t^3;
    
elseif(t>td/2 && t<=(tm-td/2))
    Q_val = -Q_max;
    
elseif(t>(tm-td/2) && t<=(tm+td/2))
    %     a0 = -(2*(Q_max*td^4*tm - 4*Q_max*td^3*tm^2 + 4*Q_max*td^2*tm^3 + 6*Q_max*td*tm^2 - 8*Q_max*tm^3))/td^3;
    %     a1 = (2*(Q_max*td^4 - 8*Q_max*td^3*tm + 12*Q_max*td^2*tm^2 + 12*Q_max*td*tm - 24*Q_max*tm^2))/td^3;
    %     a2 = -(4*(- 2*Q_max*td^3 + 6*Q_max*tm*td^2 + 3*Q_max*td - 12*Q_max*tm))/td^3;
    %     a3 = -(8*(- Q_max*td^2 + 2*Q_max))/td^3;
    a0 = 0;
    a1 = (3*Q_max)/td;
    a2 = 0;
    a3 = -(4*Q_max)/td^3;
    Q_val = a0 + a1*(t-tm) + a2*(t-tm)^2 + a3*(t-tm)^3;
    
elseif(t>(tm+td/2) && t<=(2*tm - td/2))
    Q_val = Q_max;
    
elseif(t>(2*tm - td/2) && t<=(2*tm))
    a0 = 0;
    a1 = -(3*Q_max)/td;
    a2 = 0;
    a3 = (4*Q_max)/td^3;
    Q_val = a0 + a1*(t-2*tm) + a2*(t-2*tm)^2 + a3*(t-2*tm)^3;
end
end