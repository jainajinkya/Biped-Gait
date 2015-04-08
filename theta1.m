function theta1_val = theta1(t, type)

global tm td theta1_max

% if(strcmp(class(t),'sym'))
%     syms a0 a1 a2 a3
%     theta1_val = a0 + a1*t + a2*t^2 + a3*t^3;
% 
% else
%     t = t - floor(t/tm)*tm ;

t = t - floor(t/tm)*tm ;

if(t<=td/2)
    a0 = -theta1_max;
    a1 = 0;
    a2 = 0;
    a3 = 0;
    
    % elseif(((t>(tm-td/2))&&(t<=tm))||((t>(2*tm-td/2))&&(t<=2*tm)))
elseif((t>(tm-td/2))&&(t<=tm))
    a0 = theta1_max;
    a1 = 0;
    a2 = 0;
    a3 = 0;
    
else
    a0 = (3*theta1_max*td^2*tm - 6*theta1_max*td*tm^2 + 2*theta1_max*tm^3)/(2*(td - tm)*(td^2 - 2*td*tm + tm^2));
    a1 = -(3*(theta1_max*td^2 - 2*theta1_max*tm*td))/((td - tm)*(td^2 - 2*td*tm + tm^2));
    a2 = -(6*theta1_max*tm)/((td - tm)*(td^2 - 2*td*tm + tm^2));
    a3 = (4*theta1_max)/((td - tm)*(td^2 - 2*td*tm + tm^2));
end

if(strcmp(type, 'char'))
    syms t
end

theta1_val = a0 + a1*t + a2*t^2 + a3*t^3;
end