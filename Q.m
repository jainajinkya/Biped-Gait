function Q_val = Q(t,type)
global td tm Q_max

% if(strcmp(class(t),'sym'))
%     syms a0 a1 a2 a3
%     Q_val_sym = @(t)(a0 + a1*t + a2*t^2 + a3*t^3);
%     Q_val = sym(Q_val_sym);
% else

t = t - floor(t/(2*tm))*(2*tm) ;   %2*tm i sused instead of tm cause the total time after which the cycle should repeat is 2*tm and not tm
if(t<=td/2)
    a0 = 0;
    a1 = -(3*Q_max)/td;
    a2 = 0;
    a3 = (4*Q_max)/td^3;
    
    %         if(strcmp(type, 'char'))
    %             syms t
    %         end
    %         Q_val = a0 + a1*t + a2*t^2 + a3*t^3;
    if(strcmp(type, 'char'))
        syms t1
        Q_val = a0 + a1*t1 + a2*t1^2 + a3*t1^3;
    else
        Q_val = a0 + a1*t + a2*t^2 + a3*t^3;
    end
    
    
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
    
    %         if(strcmp(type, 'char'))
    %             syms t
    %         end
    %         Q_val = a0 + a1*(t-tm) + a2*(t-tm)^2 + a3*(t-tm)^3;
    
    if(strcmp(type, 'char'))
        syms t1
        %         Q_val = a0 + a1*(t - floor(t/(2*tm))*(2*tm) - tm) + a2*(t - floor(t/(2*tm))*(2*tm) - tm)^2 + a3*(t - floor(t/(2*tm))*(2*tm) - tm)^3;
        Q_val = a0 + a1*(t1-tm) + a2*(t1-tm)^2 + a3*(t1-tm)^3;
    else
        Q_val = a0 + a1*(t-tm) + a2*(t-tm)^2 + a3*(t-tm)^3;
    end
    %
    
elseif(t>(tm+td/2) && t<=(2*tm - td/2))
    Q_val = Q_max;
    
elseif(t>(2*tm - td/2) && t<=(2*tm))
    a0 = 0;
    a1 = -(3*Q_max)/td;
    a2 = 0;
    a3 = (4*Q_max)/td^3;
    
    if(strcmp(type, 'char'))
        syms t1
        Q_val = a0 + a1*(t1-2*tm) + a2*(t1-2*tm)^2 + a3*(t1-2*tm)^3;
    end
    Q_val = a0 + a1*(t-2*tm) + a2*(t-2*tm)^2 + a3*(t-2*tm)^3;
    
    %     if(strcmp(type, 'char'))
    %         syms t
    %         Q_val = a0 + a1*(t - floor(t/(2*tm))*(2*tm) - 2*tm) + a2*(t - floor(t/(2*tm))*(2*tm) - 2*tm)^2 + a3*(t - floor(t/(2*tm))*(2*tm) - 2*tm)^3;
    %     else
    %         Q_val = a0 + a1*(t-2*tm) + a2*(t-2*tm)^2 + a3*(t-2*tm)^3;
    %     end
    
end
