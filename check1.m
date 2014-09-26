clear all
clc

global l1 l2 tm td
l1 = 1;
l2 = 0.5;
tm = 4;
td = 1.2;
% ph = phi(0.5,pi/6,1.5);

t = linspace(0,4);
for i = 1:100
    th1(i) = theta1(t(i),pi/6);
    th2(i) = theta2(t(i),pi/6,pi/4);
end

figure
plot(t,th1);

figure
plot(t,th2);