function [x_e, x_d, x_c2, x_q, x_c] = static_leg(phi_val,Q_val,t)

global l1 l2 l3 l5 tm x_ori

%% Factors correlating the Sagittal and Frontal Planes
Kc = cos(phi_val)/cos(Q_val);
Kd = cos(phi_val)/cos(Q_val);

%%
x_q = x_ori;
x_q(1) = x_ori(1) + l3 ;
x_e = x_ori;

%% Sagittal Plane
x_c(1) = x_ori(1) - (l1+l2)*sin(phi_val);
x_c(3) = x_ori(3) + (l1+l2)*cos(phi_val);

x_c2(1) = x_ori(1) - (l1+l2)*sin(phi_val);
x_c2(3) = x_ori(3) + (l1+l2)*cos(phi_val);

x_d(1) = x_ori(1) - (l1)*sin(phi_val);
x_d(3) = x_ori(3) + (l1)*cos(phi_val);

%% Frontal Plane


if(t<=tm)
    x_c2(2) = x_ori(2) - Kc*(l1+l2)*sin(Q_val) + l5/2;
    x_c(2) = x_ori(2) - Kc*(l1+l2)*sin(Q_val);
    x_d(2) = x_ori(2) - Kd*l1*sin(Q_val) + l5/2;
    x_e(2) = x_ori(2) + l5/2;
    x_q(2) = x_e(2);
    
elseif(t>tm)
    x_c2(2) = x_ori(2) - Kc*(l1+l2)*sin(Q_val) - l5/2 ;
    x_c(2) = x_ori(2) - Kc*(l1+l2)*sin(Q_val) ;
    x_d(2) = x_ori(2) - Kd*l1*sin(Q_val) - l5/2 ;
    x_e(2) = x_ori(2) - l5/2 ;
    x_q(2) = x_e(2);
end
end