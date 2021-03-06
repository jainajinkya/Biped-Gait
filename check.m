clear all
% close all
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

maxParameters();

%% Generating time points
t_req = 5*tm;
t_resol = 50;
t_div = tm/t_resol;
t = t_div*ones(1,1) ;

for i=1:(t_req/t_div)-1
    t(i+1,1) = t(i,1) + t_div;
end

x_a = zeros(length(t),3);

%% Simulations
for i = 1:length(t)
    step_inc = 0;
    phi_val = phi(t(i), 'val') ;
    theta1_val = theta1(t(i), 'val');
    theta2_val = theta2(t(i), 'val');
    Q_val = Q(t(i), 'val');
    the_a_val = theta_a(t(i), 'val');
    
    if(i>=(t_resol) && rem(i,t_resol)==0)
        step_inc = 1;
        %     elseif(i==(t_resol+2))
        %         step_inc = 1;
    end
    
    [x_e(i,:), x_d(i,:), x_c2(i,:), x_q(i,:) ,x_c(i,:)] = static_leg(phi_val,Q_val,t(i),step_inc);
    [x_a(i,:), x_b(i,:), x_c1(i,:), x_p(i,:)] = swing_leg(phi_val,theta1_val,theta2_val,the_a_val,Q_val,t(i));
    %     [x_zmp(i,:), res] = stable(phi_val,Q_val);
    %     [inv_phi(i),inv_theta1(i),inv_theta2(i),inv_theta_a(i),inv_Q(i)] = invDyna(x_a(i,:), x_b(i,:), x_c(i,:), x_p(i,:));
end

% plot(x_c(:,1), x_c(:,3))
% hold on
% sm_c = smooth(x_c(:,1), x_c(:,3), 'sgolay');
% plot(x_c(:,1),sm_c(:,1));%,['r','o']);
% hold off
% for i = 1:length(t)
%     torques(i,:) = dyna_eqn(t(i));% Rectify the input
% end
%
% %% Point to consider: The torque values must be for each leg. Supply the angular values separately for each leg.
%
% torques(1,2)
% % plot(t,torques);

%% Plotting

% % Video for Sagittal Plane
% figure
% hold on
% pause(2);
% axis( [-0.8 6 -0.05 1]);
%
% ax = gca;
% % ax.NextPlot = 'replaceChildren';
%
% % vidObj = VideoWriter('Biped-gait.avi');
% % vidObj.FrameRate= 10;
% % open(vidObj);
%
% for i=1:length(t)
%     % Swing Leg
%     L1 = makeLine([x_c(i,1) x_c(i,3)],[x_b(i,1) x_b(i,3)]);
%     L2 = makeLine([x_b(i,1) x_b(i,3)],[x_a(i,1) x_a(i,3)]);
%     L3 = makeLine([x_a(i,1) x_a(i,3)],[x_p(i,1) x_p(i,3)]);
%     h1 = plot(L1(:,1),L1(:,2));
%     h2 = plot(L2(:,1),L2(:,2));
%     h3 = plot(L3(:,1),L3(:,2));
%
%
%     % Static Leg
%     L4 = makeLine([x_d(i,1) x_d(i,3)],[x_c(i,1) x_c(i,3)]);
%     L5 = makeLine([x_e(i,1) x_e(i,3)],[x_d(i,1) x_d(i,3)]);
%     L6 = makeLine([x_e(i,1) x_e(i,3)],[x_q(i,1) x_q(i,3)]);
%     h4 = plot(L4(:,1),L4(:,2),['r']);
%     h5 = plot(L5(:,1),L5(:,2),['r']);
%     h6 = plot(L6(:,1),L6(:,2),['r']);
%
%     pause(0.3);
% %     F = getframe;
% %     writeVideo(vidObj,F);
%     delete(h1,h2,h3,h4,h5,h6);
%
% end
% % close(vidObj);
% close


%
% %% Video for frontal plane
% figure
% hold on
% pause(1);
% axis( [-0.8 0.8 -0.05 1]);
%
% ax = gca;
% ax.NextPlot = 'replaceChildren';
% %
% % vidObj1 = VideoWriter('Biped-gait-frontal.avi');
% % vidObj1.FrameRate= 10;
% % open(vidObj1);
% %
% %
% for i=1:length(t)
%     %Swing Leg
%     L1 = makeLine([x_c1(i,2) x_c1(i,3)],[x_b(i,2) x_b(i,3)]);
%     L2 = makeLine([x_b(i,2) x_b(i,3)],[x_a(i,2) x_a(i,3)]);
%     L3 = makeLine([x_a(i,2) x_a(i,3)],[x_p(i,2) x_p(i,3)]);
%     L7 = makeLine([x_c(i,2) x_c(i,3)],[x_c1(i,2) x_c1(i,3)]);
%     h1 = plot(L1(:,1),L1(:,2),['b' 'o']);
%     h2 = plot(L2(:,1),L2(:,2), ['b' 'o']);
%     h3 = plot(L3(:,1),L3(:,2), ['b' 'o']);
%     h7 = plot(L7(:,1),L7(:,2), ['b' 'o']);
%
%     %Static Leg
%     L4 = makeLine([x_d(i,2) x_d(i,3)],[x_c2(i,2) x_c2(i,3)]);
%     L5 = makeLine([x_e(i,2) x_e(i,3)],[x_d(i,2) x_d(i,3)]);
%     L6 = makeLine([x_e(i,2) x_e(i,3)],[x_q(i,2) x_q(i,3)]);
%     L8 = makeLine([x_c(i,2) x_c(i,3)],[x_c2(i,2) x_c2(i,3)]);
%     h4 = plot(L4(:,1),L4(:,2),['r' 'o']);
%     h5 = plot(L5(:,1),L5(:,2),['r' 'o']);
%     h6 = plot(L6(:,1),L6(:,2),['r' 'o']);
%     h8 = plot(L8(:,1),L8(:,2),['r' 'o']);
%
%     pause(0.3);
% %     F = getframe;
% %     writeVideo(vidObj1,F);
%     delete(h1,h2,h3,h4,h5,h6,h7,h8);
%
% end
% % close(vidObj1);


%% Angular Plotting
%
for i = 1:length(t)
    ph(i)  = phi(t(i),'val');
    th1(i) = theta1(t(i),'val');
    th2(i) = theta2(t(i),'val');
    th_a(i) = theta_a(t(i),'val');
    Q_te(i) = Q(t(i),'val');
end


% close
figure
plot(t,(ph));
% hold on
% plot(t,inv_phi,['r','o']);
% hold off
title('plot of phi');
%
% figure
% plot(t,th1);
% hold on
% plot(t,inv_theta1,['r','o']);
% hold off
% title('plot of theta-1');
%
% figure
% plot(t,th2);
% hold on
% plot(t,inv_theta2,['r','o']);
% hold off
% title('plot of theta-2');
%
% figure
% plot(t,th_a);
% hold on
% plot(t,inv_theta_a,['r','o']);
% hold off
% title('plot of theta-a');
%
figure
plot(t,Q_te);
hold on
plot(t,inv_Q,['r','o']);
hold off
title('plot of Q');