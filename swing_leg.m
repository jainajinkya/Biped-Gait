function [x_a,x_b,x_p] = swing_leg(phi,theta1,theta2,Q,t)

x_b(1) = x_e(1) - (l1+l2)*sin(phi) + l2*sin(theta1);
x_b(3) = x_e(3) + (l1+l2)*cos(phi) - l2*cos(theta1);

x_a(1) = x_e(1) - (l1+l2)*sin(phi) + l2*sin(theta1) + l1*sin(theta2);
x_a(3) = x_e(3) + (l1+l2)*cos(phi) - l2*cos(theta1) - l1*cos(theta2);



end