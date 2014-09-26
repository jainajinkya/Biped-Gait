function [x_c, x_d, x_q] = static_leg(phi,Q,t)

%% Factors correlating the Saggittal Planes and Frontal Planes
Kc = cos(phi)/cos(Q);
Kd = cos(phi)/cos(Q);

%%
x_q = x_e;

%% Saggittal Plane
x_c(1) = x_e(1) - (l1+l2)*sin(phi);
x_c(3) = x_e(3) + (l1+l2)*cos(phi);

x_d(1) = x_e(1) - (l1)*sin(phi);
x_d(3) = x_e(3) + (l1)*cos(phi);

%% Frontal Plane
if(t<tm)
    x_c(2) = x_e(2) - Kc*(l1+l2)*sin(Q) + (l5)/2;
    x_d(2) = x_e(2) - Kd*l1*sin(Q) + (l5)/2;
   
elseif(t>=tm)
    x_c(2) = x_e(2) - Kc*(l1+l2)*sin(Q) - (l5)/2;
    x_d(2) = x_e(2) - Kd*l1*sin(Q) - (l5)/2;
    
end
end