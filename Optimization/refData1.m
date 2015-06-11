function [X_des, U_des] = refData1()

cd ../LifeMOD_data/
load casey_RAnk_angle_rad
load casey_RHip_angle_rad
load casey_RKnee_angle_rad
load casey_LAnk_angle_rad
load casey_LHip_angle_rad
load casey_LKnee_angle_rad
load casey_RAnk_torque
load casey_RHip_torque
load casey_RKnee_torque
load casey_LAnk_torque
load casey_LHip_torque
load casey_LKnee_torque


%% Generating Q_ref
cd ..
load lifeMod_data_pro

Q_ref =[];

RStance = round([1:18, 44:67, 93:115]);
LStance = round([19:43, 68:92, 116:128]);
l1 = 402;
l2 = 447;

for i=1:128
    if(ismember(i,RStance))
        x_e = RAnk_pro(i,:);
        x_c = COM_pro(i,:);
    elseif(ismember(i,LStance))
        x_e = LAnk_pro(i,:);
        x_c = COM_pro(i,:);
    end
    
    x_ori(2) = (LAnk_pro(i,3) + RAnk_pro(i,3))/2;
    
    num = (x_e(2)-x_c(2));
    deno = (x_c(4)-x_e(4));
    phi = atan2(num, deno);
    cph(i) = cos(phi);
    ph(i) = phi;
    
    num = (x_ori(2) - x_c(3));
    deno = cos(phi)*(l1+l2);
    Q_ref = [Q_ref; atan2(num,deno)];
end
time = [0:0.01:2.5];
time = round(time.*100)/100;
Q_ref = interp1(LAnk_pro(:,1), Q_ref, time);
Q_ref = [time; Q_ref]';


LSwing = [0:0.01:0.35, 0.85:0.01:1.33, 1.83:0.01:2.31];
RSwing = [0.36:0.01:0.84, 1.34:0.01:1.82, 2.32:0.01:2.51];

LSwing = round(LSwing.*100)/100;
RSwing = round(RSwing.*100)/100;

for t1 = 1:251
    t = (t1-1)/100;
    
    if(ismember(t,LSwing))
        phi(t1,1) = casey_RHip_angle_rad(t1,2);
        theta1(t1,1) = casey_LHip_angle_rad(t1,2);
        theta2(t1,1) = casey_LKnee_angle_rad(t1,2);
        theta_a(t1,1) = casey_LAnk_angle_rad(t1,2);
        Q(t1,1) = Q_ref(t1,2);
        t_phi(t1,1) = 0.87*(casey_RHip_torque(t1,2)+ casey_RAnk_torque(t1,2));
        t_theta1(t1,1) = casey_LHip_torque(t1,2);
        t_theta2(t1,1) = casey_LKnee_torque(t1,2);
        t_theta_a(t1,1) = casey_LAnk_torque(t1,2);
        t_Q(t1,1) = 0.13*(casey_RHip_torque(t1,2)+ casey_RAnk_torque(t1,2) + casey_LHip_torque(t1,2)+ casey_LAnk_torque(t1,2))/4;
        
    elseif(ismember(t,RSwing))
        phi(t1,1) = casey_LHip_angle_rad(t1,2);
        theta1(t1,1) = casey_RHip_angle_rad(t1,2);
        theta2(t1,1) = casey_RKnee_angle_rad(t1,2);
        theta_a(t1,1) = casey_RAnk_angle_rad(t1,2);
        Q(t1,1) = Q_ref(t1,2);
        t_phi(t1,1) = 0.87*(casey_LHip_torque(t1,2)+ casey_LAnk_torque(t1,2));
        t_theta1(t1,1) = casey_RHip_torque(t1,2);
        t_theta2(t1,1) = casey_RKnee_torque(t1,2);
        t_theta_a(t1,1) = casey_RAnk_torque(t1,2);
        t_Q(t1,1) = 0.13*(casey_RHip_torque(t1,2)+ casey_RAnk_torque(t1,2) + casey_LHip_torque(t1,2)+ casey_LAnk_torque(t1,2))/4;
    end
end


for t1 = 1:250
    t = (t1-1)/100;
    
    if(ismember(t,LSwing))
        phi_dot(t1,1) = (casey_RHip_angle_rad(t1+1,2) - casey_RHip_angle_rad(t1,2))/0.01;
        theta1_dot(t1,1) = (casey_LHip_angle_rad(t1+1,2) - casey_LHip_angle_rad(t1,2))/0.01;
        theta2_dot(t1,1) = (casey_LKnee_angle_rad(t1+1,2) - casey_LKnee_angle_rad(t1,2))/0.01;
        theta_a_dot(t1,1) = (casey_LAnk_angle_rad(t1+1,2) - casey_LAnk_angle_rad(t1,2))/0.01;
        Q_dot(t1,1) = (Q_ref(t1+1,2) - Q_ref(t1,2))/0.01;
        
    elseif(ismember(t,RSwing))
        phi_dot(t1,1) = (casey_LHip_angle_rad(t1+1,2) - casey_LHip_angle_rad(t1,2))/0.01;
        theta1_dot(t1,1) = (casey_RHip_angle_rad(t1+1,2)- casey_RHip_angle_rad(t1,2))/0.01;
        theta2_dot(t1,1) = (casey_RKnee_angle_rad(t1+1,2) - casey_RKnee_angle_rad(t1,2))/0.01;
        theta_a_dot(t1,1) = (casey_RAnk_angle_rad(t1+1,2) - casey_RAnk_angle_rad(t1,2))/0.01;
        Q_dot(t1,1) = (Q_ref(t1+1,2) - Q_ref(t1,2))/0.01;
    end
end


X_des = [time', phi(:,1), [phi_dot(:,1); 0], theta1(:,1), [theta1_dot(:,1); 0], theta2(:,1), [theta2_dot(:,1); 0], theta_a(:,1),...
            [theta_a_dot(:,1); 0], Q(:,1), [Q_dot(:,1); 0]];
U_des = [time', t_phi(:), t_theta1(:), t_theta2(:), t_theta_a(:), t_Q(:)];

cd Final\
end