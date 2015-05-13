function Q_ref = refData()

cd ../LifeMOD_data/
load casey_RAnk_angle
load casey_RHip_angle
load casey_RKnee_angle
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
        % %         x_a = LAnk_pro(i,:);
        % %         x_b = LKnee_pro(i,:);
        % %         x_c1 = COM2_pro(i,:);
        %
    elseif(ismember(i,LStance))
        x_e = LAnk_pro(i,:);
        %        x_a = RAnk_pro;
        %        x_b = RKnee_pro;
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

X_des = [casey_RHip_angle; Qref; ]
% close all
% figure
% plot(cph);
% figure
% plot(ph)
% figure
% plot(Q_ref);
cd Final\

end