function [x_model] = sys_model(t, step_inc)%(x_desire,t, step_inc)

%global l1 l2 l3 l4 l5 tm td Ls x_ori t_resol

% xp = x_desire(1,:);
% xa = x_desire(2,:);
% xb = x_desire(3,:);
% xc = x_desire(4,:);
% xc1 = x_desire(5,:);
% xc2 = x_desire(6,:);
% xd = x_desire(7,:);
% xe = x_desire(8,:);
% xq = x_desire(9,:);
%
% [phi,theta1,theta2,theta_a,Q] = invDyna(xa, xb, xc, xp);
%
% [x_e, x_d, x_c2, x_q, x_c] = static_leg(phi,Q,t,step_inc);
% [x_a, x_b, x_c1, x_p] = swing_leg(phi,theta1,theta2,theta_a,Q,t);
%
% x_model = [x_p; x_a; x_b; x_c; x_c1; x_c2; x_d; x_e; x_q];


phi_val = phi(t, 'val') ;
theta1_val = theta1(t, 'val');
theta2_val = theta2(t, 'val');
Q_val = Q(t, 'val');
the_a_val = theta_a(t, 'val');

[x_e, x_d, x_c2, x_q, x_c] = static_leg(phi_val,Q_val,t,step_inc);
[x_a, x_b, x_c1, x_p] = swing_leg(phi_val,theta1_val,theta2_val,the_a_val,Q_val,t);
x_model = [x_p; x_a; x_b; x_c; x_c1; x_c2; x_d; x_e; x_q];


end