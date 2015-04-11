function phi_val = phi(t,type)

global l1 l2 tm Vc phi_max

t = t - floor(t/tm)*tm ;

a0 = phi_max;
a1 = 0;
a2 = -6*phi_max/tm^2;
a3 = 4*phi_max/tm^3;


% if(~strcmp(class(t),'sym'))
%     t = t - floor(t/tm)*tm ;
% end

% if (strcmp(type,'char'))
%     syms t
%     phi_val = a0 + a1*(t - floor(t/tm)*tm) + a2*(t - floor(t/tm)*tm) ^2 + a3*(t - floor(t/tm)*tm) ^3;
% else
%     phi_val = a0 + a1*t + a2*t^2 + a3*t^3;
% end

if (strcmp(type,'char'))
    syms t
end
    phi_val = a0 + a1*t + a2*t^2 + a3*t^3;

end