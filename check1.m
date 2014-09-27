clear all
clc

global l1 l2 l3 l4 l5 tm td x_e Q_max
l1 = 0.5;
l2 = 0.5;
l3 = 0.25;
l4 = 0.08;
l5 = 0.3;
tm = 1.6;
td = 0.5;
Q_max = pi/12 ;
x_e = [0 0 0];
H_vel = 0.9;
Ls = 0.4;

maxParameters(Ls,H_vel);

% t = [0,td/6, td/3,td/2];
t = [0];

for i = 1:length(t);
   phi_val = phi(t(i)) ;
   theta1_val = theta1(t(i));
   theta2_val = theta2(t(i));
   the_a(i) = theta_a(t(i),phi_val,theta1_val,theta2_val);
   %[x_c(i,:), x_d(i,:), x_q(i,:)] = static_leg(phi_val,0,t);

end

% figure
% hold on
% for i=1:4
%     L1 = makeLine([x_e(1) x_e(3)],[x_d(i,1) x_d(i,3)]);
%     L2 = makeLine([x_d(i,1) x_d(i,3)],[x_c(i,1) x_c(i,3)]);
%     L3 = makeLine([x_e(1) x_e(3)],[x_q(i,1) x_q(i,3)]);
%     plot(L1(:,1),L1(:,2));
%     plot(L2(:,1),L2(:,2));
%     plot(L3(:,1),L3(:,2));
% end




% ph = phi(0.5,pi/6,1.5);

% t = linspace(0,4);
% for i = 1:100
%     th1(i) = theta1(t(i),pi/6);
%     th2(i) = theta2(t(i),pi/6,pi/4);
% end
% 
% figure
% plot(t,th1);
% 
% figure
% plot(t,th2);