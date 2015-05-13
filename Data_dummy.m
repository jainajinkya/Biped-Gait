close all
clear all
load casey_RKnee_torque
load casey_LKnee_torque
casey_RKnee_torque = casey_RKnee_torque(1:251,:);
casey_RKnee_torque(:,1) = casey_LKnee_torque(:,1);
plot(casey_RKnee_torque(:,1), casey_RKnee_torque(:,2))
data_Q = casey_RKnee_torque(35:65,2);
data_v = interp1([0.34:0.01:0.64],data_Q,[0.34:0.1:0.64],'pchip');
data_v = interp1([0.34:0.1:0.64],data_v,[0.34:0.01:0.64],'pchip');
plot(data_v)
casey_RKnee_torque(35:65,2) = data_v;
save('casey_RKnee_torque.txt', 'casey_RKnee_torque', '-ascii');
figure
plot(casey_RKnee_torque(:,1), casey_RKnee_torque(:,2));