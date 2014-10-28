function [x_a,x_b,x_c1,x_p] = swing_leg(phi_val,theta1_val,theta2_val,theta_a_val,Q_val,t)

global l1 l2 l3 l4 l5 tm x_ori

%% Factors correlating the Sagittal and Frontal Planes
Kd = cos(phi_val)/cos(Q_val);

%theta_a = acos((x_ori(3)+(l1+l2)*cos(phi)-l2*cos(theta1)-l1*cos(theta2))/l3)

%% Sagittal Plane
x_b(1) = x_ori(1) - (l1+l2)*sin(phi_val) + l2*sin(theta1_val);   % trajectory of theta1 will handle the appropriate variations
x_b(3) = x_ori(3) + (l1+l2)*cos(phi_val) - l2*cos(theta1_val);

x_a(1) = x_ori(1) - (l1+l2)*sin(phi_val) + l2*sin(theta1_val) + l1*sin(theta2_val); % trajectory of theta2 will handle the appropriate variations
x_a(3) = x_ori(3) + (l1+l2)*cos(phi_val) - l2*cos(theta1_val) - l1*cos(theta2_val);

x_c1(1) = x_ori(1) - (l1+l2)*sin(phi_val);
x_c1(3) = x_ori(3) + (l1+l2)*cos(phi_val);

x_p(1) = x_a(1) + l3*sin(theta_a_val);
x_p(3) = x_a(3) - l3*cos(theta_a_val); % find x_p using x_a always...define trjectory of theta_a judiciously

%% Frontal plane

if(t<=tm)
    x_b(2) = x_ori(2) - Kd*l1*sin(Q_val) - (l5)/2; % trajectory of Q will handle the appropriate variations
    x_c1(2) = x_ori(2) - Kd*(l1+l2)*sin(Q_val) - (l5/2);
    x_a(2) = x_ori(2) - (l5)/2;
    x_p(2) = x_ori(2) - (l5)/2;
    
elseif(t>tm)
    x_b(2) = x_ori(2) - Kd*l1*sin(Q_val) + (l5)/2;
    x_c1(2) = x_ori(2) - Kd*(l1+l2)*sin(Q_val) + (l5)/2;
    x_a(2) = x_ori(2) + (l5)/2;
    x_p(2) = x_ori(2) + (l5)/2;
end