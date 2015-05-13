% angle1 represents sagittal plane angle; While angle 2 represnets frontal
% plane angle
% X = [Ang_HL1; dotAng_HL1; Ang_HL2; dotAng_HL2; Ang_KL1; dotAng_KL1; Ang_KL2; dotAng_KL2; Ang_AL1; dotAng_AL1; Ang_AL2; dotAng_AL2; ...
%      Ang_HR1; dotAng_HR1; Ang_HR2; dotAng_HR2; Ang_KR1; dotAng_KR1; Ang_KR2; dotAng_KR2; Ang_AR1; dotAng_AR1; Ang_AR2; dotAng_AR2];
clear all; close all; clc

%% Loading Reference data
cd ../LifeMOD_data/
load casey_RAnk_angle casey_RHip_angle casey_RKnee_angle
load casey_LAnk_torque casey_LHip_torque casey_LKnee_torque

%% Generating Q_ref
cd ..
load lifeMod_data_pro

Q_ref = refData();

global m2 m3 m4 m5 m6 m7 l1 l2 l3 l4 l5 h w
syms t
t1 = 0.23;
% phi = sym('phi(t)');
% theta1 = sym('theta1(t)');
% theta2 = sym('theta2(t)');
% theta_a = sym('theta_a(t)');
% Q = sym('Q(t)');
% 
% phi_dot = (diff(phi,t));
% theta1_dot = (diff(theta1,t));
% theta2_dot = (diff(theta2,t));
% theta_a_dot = (diff(theta_a,t));
% Q_dot = (diff(Q,t));

LSwing = [0:0.01:0.35, 0.85:0.01:1.33, 1.83:0.01:2.31];
RSwing = [0.36:0.01:0.84, 1.34:0.01:1.82, 2.32:0.01:2.51];

LSwing = round(LSwing.*100)/100;
RSwing = round(RSwing.*100)/100;


if(ismember(t1,LSwing))
    dotAng_HL1 = theta1_dot;    Ang_HL1 = theta1;
    dotAng_HL2 = Q_dot;         Ang_HL2 = Q;
    dotAng_KL1 = theta2_dot;    Ang_KL1 = theta2;
    dotAng_KL2 = Q_dot;         Ang_KL2 = Q;
    dotAng_AL1 = theta_a_dot;   Ang_AL1 = theta_a;
    dotAng_AL2 = Q_dot;         Ang_AL2 = Q;
    dotAng_HR1 = phi_dot;       Ang_HR1 = phi;
    dotAng_HR2 = Q_dot;         Ang_HR2 = Q;
    dotAng_KR1 = phi_dot;       Ang_KR1 = phi;
    dotAng_KR2 = Q_dot;         Ang_KR2 = Q;
    dotAng_AR1 = phi_dot;       Ang_AR1 = phi;
    dotAng_AR2 = Q_dot;         Ang_AR2 = Q;
    
elseif(ismember(t1,RSwing))
    dotAng_HL1 = phi_dot;       Ang_HL1 = phi;
    dotAng_HL2 = Q_dot;         Ang_HL2 = Q;
    dotAng_KL1 = phi_dot;       Ang_KL1 = phi;
    dotAng_KL2 = Q_dot;         Ang_KL2 = Q;
    dotAng_AL1 = phi_dot;       Ang_AL1 = phi;
    dotAng_AL2 = Q_dot;         Ang_AL2 = Q;
    dotAng_HR1 = theta1_dot;    Ang_HR1 = theta1;
    dotAng_HR2 = Q_dot;         Ang_HR2 = Q;
    dotAng_KR1 = theta2_dot;    Ang_KR1 = theta2;
    dotAng_KR2 = Q_dot;         Ang_KR2 = Q;
    dotAng_AR1 = theta_a_dot;   Ang_AR1 = theta_a;
    dotAng_AR2 = Q_dot;         Ang_AR2 = Q;
end

X = [Ang_HL1; dotAng_HL1; Ang_HL2; dotAng_HL2; Ang_KL1; dotAng_KL1; Ang_KL2; dotAng_KL2; Ang_AL1; dotAng_AL1; Ang_AL2; dotAng_AL2; ...
     Ang_HR1; dotAng_HR1; Ang_HR2; dotAng_HR2; Ang_KR1; dotAng_KR1; Ang_KR2; dotAng_KR2; Ang_AR1; dotAng_AR1; Ang_AR2; dotAng_AR2];

X_dot = deriv(X,t);









