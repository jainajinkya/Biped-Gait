clear all
close all
clc

global l1 l2 l3 l4 l5 tm td Ls x_ori t_resol Vc phi_max theta1_max theta2_max Q_max
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

% t = linspace(0,10*tm);
%% Generating time points
t_req = 10*tm;
t_resol = 10;
t_div = tm/t_resol;
t= [t_div];

for i=1:(t_req/t_div)-1
     t(i+1,1) = t(i,1) + t_div;
end

x_a = zeros(length(t),3);

%% Simulations
for i = 1:length(t)
%     if((t(i)>tm) && ~isequal(x_ori,x_a(length(t)/2,:)))
%         x_ori(1) = x_a(length(t)/2,1);
%     end
    step_inc = 0;
    phi_val = phi(t(i)) ;
    theta1_val = theta1(t(i));
    theta2_val = theta2(t(i));
    Q_val = Q(t(i));
    the_a_val = theta_a(t(i));
    
    if(i>11 && rem(i,t_resol)==0)
        step_inc = 1;
    elseif(i==11)
        step_inc = 1;
    end
    
    [x_e(i,:), x_d(i,:), x_c2(i,:), x_q(i,:) ,x_c(i,:)] = static_leg(phi_val,Q_val,t(i),step_inc);
    [x_a(i,:), x_b(i,:), x_c1(i,:), x_p(i,:)] = swing_leg(phi_val,theta1_val,theta2_val,the_a_val,Q_val,t(i));
    [x_zmp(i,:), res] = stable(phi_val,Q_val);
%     plot(x_zmp(:,1), x_zmp(:,2));
%     pause(0.2);
end


% Video for Sagittal Plane
figure
hold on
pause(2);
axis( [-0.8 6 -0.05 1]);

ax = gca;
% ax.NextPlot = 'replaceChildren';

% vidObj = VideoWriter('Biped-gait.avi');
% vidObj.FrameRate= 10;
% open(vidObj);

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
    L5 = makeLine([x_e(i,1) x_e(i,3)],[x_d(i,1) x_d(i,3)]);
    L6 = makeLine([x_e(i,1) x_e(i,3)],[x_q(i,1) x_q(i,3)]);
    h4 = plot(L4(:,1),L4(:,2),['r']);
    h5 = plot(L5(:,1),L5(:,2),['r']);
    h6 = plot(L6(:,1),L6(:,2),['r']);

    pause(0.3);
%     F = getframe;
%     writeVideo(vidObj,F);
    delete(h1,h2,h3,h4,h5,h6);

end
% close(vidObj);
close


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


% %% Angular Plotting
% 
% for i = 1:length(t)
%     ph(i)  = phi(t(i))
%     th1(i) = theta1(t(i));
%     th2(i) = theta2(t(i));
%     th_a(i) = theta_a(t(i));
%     Q_te(i) = Q(t(i));
% end
% %
% 
% close
% figure
% plot(t,ph);
% title('plot of phi');
% 
% figure
% plot(t,th1);
% title('plot of theta-1');
% 
% figure
% plot(t,th2);
% title('plot of theta-2');
% 
% figure
% plot(t,th_a);
% title('plot of theta-a');
% 
% figure
% plot(t,Q_te);
% title('plot of Q');