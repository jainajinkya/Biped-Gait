% angle1 represents sagittal plane angle; While angle 2 represnets frontal
% plane angle
% X = [Ang_HL1; dotAng_HL1; Ang_HL2; dotAng_HL2; Ang_KL1; dotAng_KL1; Ang_KL2; dotAng_KL2; Ang_AL1; dotAng_AL1; Ang_AL2; dotAng_AL2; ...
%      Ang_HR1; dotAng_HR1; Ang_HR2; dotAng_HR2; Ang_KR1; dotAng_KR1; Ang_KR2; dotAng_KR2; Ang_AR1; dotAng_AR1; Ang_AR2; dotAng_AR2];
phi = sym('phi(t)');
theta1 = sym('theta1(t)');
theta2 = sym('theta2(t)');
theta_a = sym('theta_a(t)');
Q = sym('Q(t)');

sym_phi_dot = (diff(phi,t));
the1_dot = (diff(theta1,t));
the2_dot = (diff(theta2,t));
the_a_dot = (diff(theta_a,t));
sym_Q_dot = (diff(sym_Q,t));

LSwing = [0:0.01:0.35, 0.84:0.01:1.32, 1.82:0.01:2.31]';
RSwing = [0.36:0.01:0.83, 1.32:0.01:1.81, 2.32:0.01:2.51]';

if(ismember(t1,Lswing))
    Ang_HL1 = theta1;
    dotAng_HL1 = theta1_dot;
    Ang_HL2 = Q;
    dotAng_HL2 = Q_dot;
    Ang_KL1 = theta2;
    dotAng_KL1 = theta2_dot;
    Ang_KL2 = Q;
    dotAng_KL2 = Q_dot;
    Ang_AL1 = theta_a;
    dotAng_AL1 = theta_a_dot;
    Ang_AL2 = Q;
    dotAng_AL2 = Q_dot;
    Ang_HR1 = phi;
    dotAng_HR1 = phi_dot;
    Ang_HR2 = Q;
    dotAng_HR2 = Q_dot;
    Ang_KR1 = phi;
    dotAng_KR1 = phi_dot;
    Ang_KR2 = Q;
    dotAng_KR2 = Q_dot;
    Ang_AR1 = phi;
    dotAng_AR1 = phi_dot;
    Ang_AR2 = Q;
    dotAng_AR2 = Q_dot;
    
elseif(ismember(t1,RSwing))
    Ang_HL1 = phi;
    dotAng_HL1 = phi_dot;
    Ang_HL2 = Q;
    dotAng_HL2 = Q_dot;
    Ang_KL1 = phi;
    dotAng_KL1 = phi_dot;
    Ang_KL2 = Q;
    dotAng_KL2 = Q_dot;
    Ang_AL1 = phi;
    dotAng_AL1 = phi_dot;
    Ang_AL2 = Q;
    dotAng_AL2 = Q_dot;
    Ang_HR1 = theta1;
    dotAng_HR1 = theta1_dot;
    Ang_HR2 = Q;
    dotAng_HR2 = Q_dot;
    Ang_KR1 = theta2;
    dotAng_KR1 = theta2_dot;
    Ang_KR2 = Q;
    dotAng_KR2 = Q_dot;
    Ang_AR1 = theta_a;
    dotAng_AR1 = theta_a_dot;
    Ang_AR2 = Q;
    dotAng_AR2 = Q_dot;
end

X = [Ang_HL1; dotAng_HL1; Ang_HL2; dotAng_HL2; Ang_KL1; dotAng_KL1; Ang_KL2; dotAng_KL2; Ang_AL1; dotAng_AL1; Ang_AL2; dotAng_AL2; ...
     Ang_HR1; dotAng_HR1; Ang_HR2; dotAng_HR2; Ang_KR1; dotAng_KR1; Ang_KR2; dotAng_KR2; Ang_AR1; dotAng_AR1; Ang_AR2; dotAng_AR2];

X_dot = deriv(X,t);
 
