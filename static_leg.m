function [x_c, x_d, x_q] = static_leg(phi_val,Q_val,t)

global l1 l2 l3 l5 tm x_e

%% Factors correlating the Sagittal and Frontal Planes
Kc = cos(phi_val)/cos(Q_val);
Kd = cos(phi_val)/cos(Q_val);

%%
x_q = x_e;
x_q(1) = x_e(1) + l3 ;
%% Sagittal Plane
x_c(1) = x_e(1) - (l1+l2)*sin(phi_val);
x_c(3) = x_e(3) + (l1+l2)*cos(phi_val);

x_d(1) = x_e(1) - (l1)*sin(phi_val);
x_d(3) = x_e(3) + (l1)*cos(phi_val);

%% Frontal Plane
if(t<tm)
    x_c(2) = x_e(2) - Kc*(l1+l2)*sin(Q_val) + (l5)/2;
    x_d(2) = x_e(2) - Kd*l1*sin(Q_val) + (l5)/2;
   
elseif(t>=tm)
    x_c(2) = x_e(2) - Kc*(l1+l2)*sin(Q_val) - (l5)/2;
    x_d(2) = x_e(2) - Kd*l1*sin(Q_val) - (l5)/2;
    
end
end