% close all
% clear all
% load casey_RKnee_torque
% load casey_LKnee_torque
% casey_RKnee_torque = casey_RKnee_torque(1:251,:);
% casey_RKnee_torque(:,1) = casey_LKnee_torque(:,1);
% plot(casey_RKnee_torque(:,1), casey_RKnee_torque(:,2))
% data_Q = casey_RKnee_torque(35:65,2);
% data_v = interp1([0.34:0.01:0.64],data_Q,[0.34:0.1:0.64],'pchip');
% data_v = interp1([0.34:0.1:0.64],data_v,[0.34:0.01:0.64],'pchip');
% plot(data_v)
% casey_RKnee_torque(35:65,2) = data_v;
% save('casey_RKnee_torque.txt', 'casey_RKnee_torque', '-ascii');
% figure
% plot(casey_RKnee_torque(:,1), casey_RKnee_torque(:,2));

clear all
clc
cd LifeMOD_data/
load casey_RAnk_angle
load casey_RHip_angle
load casey_RKnee_angle
load casey_LAnk_angle
load casey_LHip_angle
load casey_LKnee_angle
load casey_RAnk_torque
load casey_RHip_torque
load casey_RKnee_torque
load casey_LAnk_torque
load casey_LHip_torque
load casey_LKnee_torque

casey_RAnk_angle_rad = [casey_RAnk_angle(:,1), deg2rad(casey_RAnk_angle(:,2))];
casey_LAnk_angle_rad = [casey_LAnk_angle(:,1), deg2rad(casey_LAnk_angle(:,2))];
casey_RHip_angle_rad = [casey_RHip_angle(:,1), deg2rad(casey_RHip_angle(:,2))];
casey_LHip_angle_rad = [casey_LHip_angle(:,1), deg2rad(casey_LHip_angle(:,2))];
casey_RKnee_angle_rad = [casey_RKnee_angle(:,1), deg2rad(casey_RKnee_angle(:,2))];
casey_LKnee_angle_rad = [casey_LKnee_angle(:,1), deg2rad(casey_RAnk_angle(:,2))];
casey_RAnk_torque(:,2) = casey_RAnk_torque(:,2)/1000 ;
casey_RKnee_torque(:,2) = casey_RKnee_torque(:,2)/1000 ;
casey_RHip_torque(:,2) = casey_RHip_torque(:,2)/1000 ;
casey_LAnk_torque(:,2) = casey_LAnk_torque(:,2)/1000 ;
casey_LKnee_torque(:,2) = casey_LKnee_torque(:,2)/1000 ;
casey_LHip_torque(:,2) = casey_LHip_torque(:,2)/1000 ;