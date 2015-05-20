% angle1 represents sagittal plane angle; While angle 2 represnets frontal
% plane angle
% X = [Ang_HL1; dotAng_HL1; Ang_HL2; dotAng_HL2; Ang_KL1; dotAng_KL1; Ang_KL2; dotAng_KL2; Ang_AL1; dotAng_AL1; Ang_AL2; dotAng_AL2; ...
%      Ang_HR1; dotAng_HR1; Ang_HR2; dotAng_HR2; Ang_KR1; dotAng_KR1; Ang_KR2; dotAng_KR2; Ang_AR1; dotAng_AR1; Ang_AR2; dotAng_AR2];

% LSwing = [0:0.01:0.35, 0.85:0.01:1.33, 1.83:0.01:2.31];
% RSwing = [0.36:0.01:0.84, 1.34:0.01:1.82, 2.32:0.01:2.51];

% if(ismember(t1,LSwing))
%     dotAng_HL1 = theta1_dot;    Ang_HL1 = theta1;
%     dotAng_HL2 = Q_dot;         Ang_HL2 = Q;
%     dotAng_KL1 = theta2_dot;    Ang_KL1 = theta2;
%     dotAng_KL2 = Q_dot;         Ang_KL2 = Q;
%     dotAng_AL1 = theta_a_dot;   Ang_AL1 = theta_a;
%     dotAng_AL2 = Q_dot;         Ang_AL2 = Q;
%     dotAng_HR1 = phi_dot;       Ang_HR1 = phi;
%     dotAng_HR2 = Q_dot;         Ang_HR2 = Q;
%     dotAng_KR1 = phi_dot;       Ang_KR1 = phi;
%     dotAng_KR2 = Q_dot;         Ang_KR2 = Q;
%     dotAng_AR1 = phi_dot;       Ang_AR1 = phi;
%     dotAng_AR2 = Q_dot;         Ang_AR2 = Q;
%
% elseif(ismember(t1,RSwing))
%     dotAng_HL1 = phi_dot;       Ang_HL1 = phi;
%     dotAng_HL2 = Q_dot;         Ang_HL2 = Q;
%     dotAng_KL1 = phi_dot;       Ang_KL1 = phi;
%     dotAng_KL2 = Q_dot;         Ang_KL2 = Q;
%     dotAng_AL1 = phi_dot;       Ang_AL1 = phi;
%     dotAng_AL2 = Q_dot;         Ang_AL2 = Q;
%     dotAng_HR1 = theta1_dot;    Ang_HR1 = theta1;
%     dotAng_HR2 = Q_dot;         Ang_HR2 = Q;
%     dotAng_KR1 = theta2_dot;    Ang_KR1 = theta2;
%     dotAng_KR2 = Q_dot;         Ang_KR2 = Q;
%     dotAng_AR1 = theta_a_dot;   Ang_AR1 = theta_a;
%     dotAng_AR2 = Q_dot;         Ang_AR2 = Q;
% end
%
% X = [Ang_HL1; dotAng_HL1; Ang_HL2; dotAng_HL2; Ang_KL1; dotAng_KL1; Ang_KL2; dotAng_KL2; Ang_AL1; dotAng_AL1; Ang_AL2; dotAng_AL2; ...
%      Ang_HR1; dotAng_HR1; Ang_HR2; dotAng_HR2; Ang_KR1; dotAng_KR1; Ang_KR2; dotAng_KR2; Ang_AR1; dotAng_AR1; Ang_AR2; dotAng_AR2];
%
% % X_dot = deriv(X,t);


% %% Loading Reference data
% cd ../LifeMOD_data/
% load casey_RAnk_angle casey_RHip_angle casey_RKnee_angle
% load casey_LAnk_torque casey_LHip_torque casey_LKnee_torque
%
% %% Generating Q_ref
% cd ..
% load lifeMod_data_pro

clear all; close all; clc
global m1 m2 m3 m4 m5 m6 m7 l1 l2 l3 l4 l5 h w
l1 = 0.45;
l2 = 0.45;
l3 = 0.15;
l4 = 0.1;
l5 = 0.4;
h = 0.05;
w = 0.08;

%% Masses
m1 = 10.5;
m2 = 2.8;
m3 = 1;
m4 = 43;
m5 = 10.5;
m6 = 2.8;
m7 = 1;


[X_des, U_des] = refData();

for i = 1:20
[A(:,:,i),B(:,:,i)]  = funcF(X_des(i,2:25), U_des(i,2:13));
end
Q = diag(diag([m3*ones(24,4) m2*ones(24,4) m1*ones(24,4) m5*ones(24,4) m6*ones(24,4) m7*ones(24,4)]));
R = eye(12);


S(:,:,:) = zeros(24,24,2);
S(:,:,20) = pinv(B(:,:,20))'*R*U_des(20,:)';

for i = 20:-1:2
    S(:,:,i-1) = S(:,:,i) + 0.01*(Q - S(:,:,i)*B(:,:,i)*inv(R)*B(:,:,i)'*S(:,:,i) + S(:,:,i)*A(:,:,i) + A(:,:,i)'*S(:,:,i));
end

X_obt = zeros(24,1);
for i = 1:19
   U_obt(:,i) = U_des(i,2:13)' - inv(R)*B(:,:,i+1)'*S(:,:,i)*(X_obt(:,i) - X_des(i,2:25)');
   X_obt(:,i+1) =  (X_obt(:,i) - X_des(i,2:25)') + 0.01*(A(:,:,i+1)*(X_obt(:,i) - X_des(i,2:25)') + B(:,:,i+1)*(U_obt(:,i) - U_des(i,2:13)'));
end




% [K,S,e] = lqr(A,B,Q,R);

% clear P K
% P(:,:,:) = zeros(24,24,2);
% K(:,:,:) = zeros(12,24,2);
% 
% for i=2:20
%     K(:,:,i) = -inv((R + B(:,:,21-i)'*P(:,:,i-1)*B(:,:,21-i)))*B(:,:,21-i)'*P(:,:,i-1)*A(:,:,21-i);
%     P(:,:,i) = Q + K(:,:,i)'*R*K(:,:,i) + (A(:,:,21-i) + B(:,:,21-i)*K(:,:,i))'*P(:,:,i-1)*(A(:,:,21-i) + B(:,:,21-i)*K(:,:,i));
% end
% 
% X_obt = zeros(24,1);
% for i=2:20
%     U_obt(:,i-1) = U_des(i-1,2:13)' + K(:,:,i)*X_obt(:,i-1);
%     X_obt(:,i) =  (X_obt(:,i-1) - X_des(i-1,2:25)') + 0.01*(A(:,:,i-1)*(X_obt(:,i-1) - X_des(i-1,2:25)') + B(:,:,i-1)*(U_obt(:,i-1) - U_des(i-1,2:13)'));
% end

% P(:,:,:) = zeros(24,24,20);
% K(:,:,:) = zeros(12,24,2);
% 
% P(:,:,20) = Q;
% 
% for i=20:-1:2
%     P(:,:,i-1) = Q + A(:,:,i)'*P(:,:,i)*A(:,:,i)- A(:,:,i)'*P(:,:,i)*B(:,:,i)*inv(R + B(:,:,i)'*P(:,:,i)*B(:,:,i))*B(:,:,i)'*P(:,:,i)*A(:,:,i);
% end
% 
% for i = 1:19
%    K(:,:,i) = -inv(R + B(:,:,i)'*P(:,:,i+1)*B(:,:,i))*B(:,:,i)'*P(:,:,i+1)*A(:,:,i);
%    U_obt(:,i) = U_des(i,2:13)' + K(:,:,i)*X_obt(:,i);
%    X_obt(:,i) =  (X_obt(:,i) - X_des(i,2:25)') + 0.01*(A(:,:,i)*(X_obt(:,i) - X_des(i,2:25)') + B(:,:,i)*(U_obt(:,i) - U_des(i,2:13)'));
% end
