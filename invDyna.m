%% Inverse Dynamics Calculation

function [phi,theta1,theta2,theta_a,Q] = invDyna(x_a, x_b, x_c, x_p)

global l1 l2 x_ori

num = (x_ori(1)-x_c(1));
deno = (x_c(3)-x_ori(3));
phi = atan2(num, deno);

num = (x_b(1)- x_ori(1) + (l1+l2)*sin(phi));
deno = (x_ori(3) + (l1+l2)*cos(phi) - x_b(3));
theta1 = atan2(num,deno);

num = (x_a(1)- x_ori(1) + (l1+l2)*sin(phi) - l2*sin(theta1));
deno = (x_ori(3) + (l1+l2)*cos(phi) - l2*cos(theta1) - x_a(3));
theta2 = atan2(num,deno);

num = x_p(1) - x_a(1);
deno = x_a(3) - x_p(3);
theta_a = atan2(num,deno);

num = (x_ori(2) - x_c(2));
deno = cos(phi)*(l1+l2);
Q = atan2(num,deno);

end