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
% m1 = 10.5;
% m2 = 2.8;
% m3 = 1;
% m4 = 43;
% m5 = 10.5;
% m6 = 2.8;
% m7 = 1;
m1 = 4.3;
m2 = 0.9;
m3 = 0.4;
m4 = 18.8;
m5 = 4.3;
m6 =0.9;
m7 = 0.4;


[X_des, U_des] = refData1();

for i = 1:251
    [A(:,:,i),B(:,:,i)]  = funcF1(X_des(i,2:11), U_des(i,2:6));
end

LSwing = [0:0.01:0.35, 0.85:0.01:1.33, 1.83:0.01:2.31];
RSwing = [0.36:0.01:0.84, 1.34:0.01:1.82, 2.32:0.01:2.51];

LSwing = round(LSwing.*100)/100;
RSwing = round(RSwing.*100)/100;

X_obt = zeros(10,1);
X_obt(:,1) = X_des(1,2:11)';
clear U_cont 

for t1 = 1:250
    A_cont = [];
    B_cont = [];
    
    co = ctrb(A(:,:,t1),B(:,:,t1));
    rk = rank(co);
    [mat1,mat2] = qr(co);
    Ah = mat1'*A(:,:,t1)*mat1;
    Bh= mat1'*B(:,:,t1);
    
    A_cont = Ah(1:rk,1:rk);
    B_cont = Bh(1:rk,:);
    Q = eye(rk);
    R = eye(5);
    [K,S,E] = lqr(A_cont,B_cont,Q,R);
    
    X_cont = mat1*(X_obt(:,t1) - X_des(t1,2:11)');
    U_cont(t1,:) = -K*X_cont(1:rk,:);
    X_obt = [X_obt, (X_des(t1+1,2:11)' + (X_obt(:,t1) - X_des(t1,2:11)') + 0.01*(Ah*(X_obt(:,t1) - X_des(t1,2:11)') + Bh*U_cont(t1,:)'))];
end

X_obt = [X_des(:,1) X_obt(:,:)'];
X_err = [X_des(:,1), X_des(:,2:11)-X_obt(:,2:11)];