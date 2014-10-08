clear all
close all
clc

global l1 l2 l3 l4 l5 tm td x_e Vc phi_max theta1_max theta2_max Q_max
l1 = 0.45;
l2 = 0.45;
l3 = 0.15;
l4 = 0.1;
l5 = 0.4;
tm = 0.5;
td = 0.2*tm;
Q_max = pi/24 ;
x_e = [0 0 0];
Ls = 0.5;

maxParameters(Ls);

t = linspace(0,tm);
% t = [0];

for i = 1:length(t)
   phi_val = phi(t(i)) ;
   theta1_val = theta1(t(i));
   theta2_val = theta2(t(i));
   Q_val = Q(t(i));
   the_a_val = theta_a(t(i));
   [x_c(i,:), x_d(i,:), x_q(i,:)] = static_leg(phi_val,Q_val,t(i));
   [x_a(i,:), x_b(i,:), x_p(i,:)] = swing_leg(phi_val,theta1_val,theta2_val,the_a_val,Q_val,t(i));
end

figure
hold on
axis equal

for i=1:length(t)
    % Swing Leg
    L1 = makeLine([x_c(i,1) x_c(i,3)],[x_b(i,1) x_b(i,3)]);
    L2 = makeLine([x_b(i,1) x_b(i,3)],[x_a(i,1) x_a(i,3)]);
    L3 = makeLine([x_a(i,1) x_a(i,3)],[x_p(i,1) x_p(i,3)]);
    h1 = plot(L1(:,1),L1(:,2));
    h2 = plot(L2(:,1),L2(:,2));
    h3 = plot(L3(:,1),L3(:,2));

    
    % Static Leg
    L4 = makeLine([x_d(i,1) x_d(i,3)],[x_c(i,1) x_c(i,3)]);
    L5 = makeLine([x_e(1) x_e(3)],[x_d(i,1) x_d(i,3)]);
    L6 = makeLine([x_e(1) x_e(3)],[x_q(i,1) x_q(i,3)]);
    h4 = plot(L4(:,1),L4(:,2),'r');
    h5 = plot(L5(:,1),L5(:,2),'r');
    h6 = plot(L6(:,1),L6(:,2),'r');
    
    pause(0.3);
    delete(h1,h2,h3,h4,h5,h6);
        
end

% 
% figure
% plot(t,phi_val);


% ph = phi(0.5,pi/6,1.5);

t = linspace(0,tm);
for i = 1:100
    th1(i) = theta1(t(i));
    th2(i) = theta2(t(i));
    th_a(i) = theta_a(t(i));
    Q_te(i) = Q(t(i));
end
% 
% figure
% plot(t,th1);
% 
% figure
% plot(t,th2);

figure
plot(t,th_a);

% figure
% plot(t,Q_te);