clear all
close all
clc

global l1 l2 l3 l4 l5 tm td x_e Vc phi_max theta1_max theta2_max Qmax
l1 = 0.45;
l2 = 0.45;
l3 = 0.25;
l4 = 0.1;
l5 = 0.4;
tm = 0.5;
td = 0.2*tm;
Q_max = pi/24 ;
x_e = [0 0 0];
Ls = 0.5;

maxParameters(Ls);

% t = [0,td/6, td/3,td/2];
% t = [0];
% 
% for i = 1:length(t);
%    phi_val = phi(t(i)) ;
%    theta1_val = theta1(t(i));
%    theta2_val = theta2(t(i));
%    the_a(i) = theta_a(t(i),phi_val,theta1_val,theta2_val);
%    %[x_c(i,:), x_d(i,:), x_q(i,:)] = static_leg(phi_val,0,t);
% 
% end

% figure
% hold on
% for i=1:4
%     L1 = makeLine([x_e(1) x_e(3)],[x_d(i,1) x_d(i,3)]);
%     L2 = makeLine([x_d(i,1) x_d(i,3)],[x_c(i,1) x_c(i,3)]);
%     L3 = makeLine([x_e(1) x_e(3)],[x_q(i,1) x_q(i,3)]);
%     L4 = makeLine([x_e(1) x_e(3)],[x_d(i,1) x_d(i,3)]);
%     L5 = makeLine([x_e(1) x_e(3)],[x_d(i,1) x_d(i,3)]);
%     plot(L1(:,1),L1(:,2));
%     plot(L2(:,1),L2(:,2));
%     plot(L3(:,1),L3(:,2));
% end




% ph = phi(0.5,pi/6,1.5);

t = linspace(0,tm);
for i = 1:100
    th1(i) = theta1(t(i));
    th2(i) = theta2(t(i));
    th_a(i) = theta_a(t(i));
end

figure
plot(t,th1);

figure
plot(t,th2);

figure
plot(t,th_a);