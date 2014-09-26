function [x_a,x_b,x_p] = swing_leg(phi,theta1,theta2,theta_a,Q,t)

%% Factors correlating the Sagittal and Frontal Planes
Kd = cos(phi)/cos(Q);

%theta_a = acos((x_e(3)+(l1+l2)*cos(phi)-l2*cos(theta1)-l1*cos(theta2))/l3)

%% Sagittal Plane
x_b(1) = x_e(1) - (l1+l2)*sin(phi) + l2*sin(theta1);   % trajectory of theta1 will handle the appropriate variations
x_b(3) = x_e(3) + (l1+l2)*cos(phi) - l2*cos(theta1);

x_a(1) = x_e(1) - (l1+l2)*sin(phi) + l2*sin(theta1) + l1*sin(theta2); % trajectory of theta2 will handle the appropriate variations
x_a(3) = x_e(3) + (l1+l2)*cos(phi) - l2*cos(theta1) - l1*cos(theta2);

x_p(1) = x_a(1) + l3*sin(theta_a);
x_p(3) = x_a(3) - l3*cos(theta_a); % find x_p using x_a always...define trjectory of theta_a judiciously

%% Frontal plane
x_a(2) = x_e(2);
x_p(2) = x_e(2);

if(t<tm)
    x_b(2) = x_e(2) - Kd*l1*sin(Q) - (l5)/2; % trajectory of Q will handle the appropriate variations
   
elseif(t>=tm)
    x_b(2) = x_e(2) - Kd*l1*sin(Q) + (l5)/2;

end