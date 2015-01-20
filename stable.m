function [x_zmp,res] = stable(phi_val,Q_val)
global l1 l2 l5 x_ori
g = 9.8;

x_zmp(1) = x_ori(1) - (l1+l2)*sin(phi_val) - ((l1+l2)*sin(phi_val)/g)*( x_ori(3) + (l1+l2)*cos(phi_val));
x_zmp(2) = x_ori(2) - (l5/2) - (l1+l2)*cos(phi_val)*tan(Q_val)...
           + ((l1+l2)/g)*(cos(phi_val)*sec(Q_val)^2 - sin(phi_val)*tan(Q_val))*( x_ori(3) + (l1+l2)*cos(phi_val));

res = 1;
end