clear all
close all
clc

global l1 l2 l3 l4 l5 tm td Ls x_ori t_resol % other global variable Vc, phi_max, theta1_max, theta2_max, Q_max
l1 = 0.45;
l2 = 0.45;
l3 = 0.15;
l4 = 0.1;
l5 = 0.4;
tm = 0.8;
td = 0.1;
x_ori = [0 0 0];
Ls = 0.5;

t_req = tm;
t_resol = 5;
t_div = tm/t_resol;
t = t_div*ones(1,1) ;

for i=1:(t_req/t_div)-1
    t(i+1,1) = t(i,1) + t_div;
end


maxParameters();
for i = 1:length(t)
    step_inc = 0;
    if(i>=(t_resol) && rem(i,t_resol)==0)
        step_inc = 1;
    end
    
    %     [x_model] = sys_model(x_desire, t(i), step_inc);
    [x_model] = sys_model(t(i), step_inc);
end

for i = 1:length(t)
    torques(i,:) = dyna_eqn(t(i));% Rectify the input
end
