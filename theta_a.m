function theta_a_val = theta_a(t,phi_val,theta1_val,theta2_val)

global l1 l2 l3 x_e td tm theta1_max theta2_max

phi_d = phi(td);
theta_a_min = acos((x_e(3)+(l1+l2)*cos(phi_d) - l2*cos(theta1_max) - l1*cos(theta2_max))/l3);

theta_a_val = acos((x_e(3)+(l1+l2)*cos(phi_val) - l2*cos(theta1_val) - l1*cos(theta2_val))/l3);


end