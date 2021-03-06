function [A,B] = funcF1(X_des,U_des)
tic
global m2 m3 m4 m5 m6 m7 l1 l2 l3 l4 h w

syms t
phi = sym('phi(t)');
theta1 = sym('theta1(t)');
theta2 = sym('theta2(t)');
theta_a = sym('theta_a(t)');
Q = sym('Q(t)');

phi_dot = (deriv(phi,t));
theta1_dot = (deriv(theta1,t));
theta2_dot = (deriv(theta2,t));
theta_a_dot = (deriv(theta_a,t));
Q_dot = (deriv(Q,t));

X = [phi; phi_dot; theta1; theta1_dot; theta2; theta2_dot; theta_a; theta_a_dot; Q; Q_dot];


Mat1 = [0,(h^2/12)*(m2+m3+m5+m6+m7)+ l1^2*(m2/3+m3+m4+m5+13*m6/12+m7) + l2^2*(m3/3+m4+13*m5/12+m6+m7) + m7*l3^2/12 + l1*l2*(m3+2*(m4+m5+m6+m7)),...
    0,(h^2/12)*(m5+m6+m7) + m6*l1^2/12 + m7*l3^2/12 + m5*l2^2/12 + (cos(phi-theta1)/2)*(m5+m6+m7)*(l2^2 + l1*l2), ...
    0, (h^2/12)*(m6+m7) + m6*l1^2/12 + m7*l3^2/12 + (cos(phi-theta2)/2)*(m6+m7)*(l1^2+l1*l2), ...
    0, m7*(h^2/12 + l3^2/12 + l3*(cos(phi-theta_a)/2)*(l1+l2)), 0, 0; ...
    ...
    0,(h^2/12)*(m5+m6+m7) + (m6*l1^2 + m5*l2^2 + m7*l3^2)/12 + (cos(phi-theta1)/2)*(m5+m6+m7)*(l2^2 + l1*l2), 0,...
    (h^2/12)*(m5+m6+m7) + m5*l2^2/3 + m6*(l1^2/3 + l2^2)/4 + m7*(l2^2 + l3^2/3)/4, 0, ...
    (h^2/12)*(m6+m7) + m7*l3^2/12 + (cos(theta1 - theta2)/4)*l1*l2*(m6+m7) + m6*l1^2/12, 0,...
    m7*(h^2+l3^2)/12 + m7*(cos(theta1 - theta_a)/4)*l2*l3, 0, ...
    0; ...
    ...
    0, (h^2/12)*(m6+m7) + (m6*l1^2 + m7*l3^2)/12 + (cos(phi-theta2)/2)*(m6+m7)*(l1^2 + l1*l2), 0,...
    (h^2/12)*(m6+m7) + (m6*l1^2 + m7*l3^2)/12 + (cos(theta1-theta2)/4)*(m6+m7)*l1*l2, 0,...
    (h^2/12)*(m6+m7) + (m6*l1^2)/3 + m7*l1^2/4 + (m7*l3^2)/12 , 0,...
    m7*(h^2+l3^2)/12 + m7*(cos(theta2 - theta_a)/4)*l1*l3, 0,...
    0; ...
    ...
    0, m7*(5*h^2 + 5*l3^2 + 30*l3*cos(phi-theta_a)*(l1+l2))/60, 0,...
    m7*(5*h^2 + 5*l3^2 + 15*l2*l3*cos(phi-theta_a))/60, 0,...
    m7*(5*h^2 + 5*l3^2 + 15*l1*l3*cos(phi-theta_a))/60, 0,...
    m7*(5*h^2 + 20*l3^2 )/60, 0,...
    0; ...
    ...
    0, 0,...
    0, 0,...
    0, 0,...
    0, 0,...
    0, m7*(h^2 + l4^2)/12 + (h^2+w^2)*(m2+m3+m5+m6)/12 + (cos(phi))^2*(m2*l1^2/4 + (m3+m5)*(2*l1+l2)^2/4 + (m6+m7)*(l1-l2)^2/4 + m4*(l1+l2)^2)];
    


Mat2 = [-phi_dot*(theta1_dot*sin(phi-theta1)*(m5+m6+m7)*(l2^2+l1*l2)/2 + theta2_dot*sin(phi-theta2)*(m6+m7)*(l1^2+l1*l2)/2 + theta_a_dot*sin(phi-theta_a)*m7*l3*(l1+l2)/2)...
    + theta1_dot^2*sin(phi-theta1)*(m5+m6+m7)*(l2^2+l1*l2)/2 + theta2_dot^2*sin(phi-theta2)*(m6+m7)*(l1^2+l1*l2)/2 + theta_a_dot^2*sin(phi-theta_a)*m7*l3*(l1+l2)/2 ...
    + Q_dot*sin(2*phi)*(l1^2*(m2/4 + m3+m4+m5+m6/4 + m7/4)/2 + l2^2*(m3/4 +m4 + m5/4 + m6/4 + m7/4)/2 + l1*l2*(m3+2*m4+m5 - m6/2 - m7/2)/2)...
    - (49/5)*sin(phi)*(l1*(m3+m4+m5+m6+m7+m2/2) + l2*(m3/2 + m4+m5+m6+m7));...
    ...
    -phi_dot^2*sin(phi-theta1)*(m5+m6+m7)*(l2^2+l1*l2)/2 + theta2_dot^2*sin(theta1-theta2)*l1*l2*(m6+m7)/4 + theta_a^2*l2*l3*m7*sin(theta1-theta_a)/4 ...
    + phi_dot*theta1_dot*sin(phi-theta1)*(m5+m6+m7)*(l2^2+l1*l2)/2 ...
    - theta1_dot*(theta2_dot*l1*l2*sin(theta1-theta2)*(m6+m7)/4 + theta_a_dot*l2*l3*m7*sin(theta1-theta_a)/4) + (49/5)*sin(theta1)*l2*(m6+m7+m5/2);...
    ...
    -phi_dot^2*sin(phi-theta2)*(m6+m7)*(l1^2+l1*l2)/2 - theta1_dot^2*l1*l2*sin(theta1-theta2)*(m6+m7)/4 + theta_a_dot^2*l1*l3*m7*sin(theta2-theta_a)/4 ...
    + theta2_dot*(phi_dot*sin(phi-theta2)*(m6+m7)*(l1^2+l1*l2)/2 + theta1_dot*sin(theta1-theta2)*l1*l2*(m6+m7)/4 - theta_a_dot*l1*l3*m7*sin(theta2-theta_a)/4) ...
    + (49/5)*l1*sin(theta2)*(2*m6 + m7); ...
    ...
    (m7/60)*(-phi_dot^2*30*l3*sin(phi-theta_a)*(l1+l2) - theta1_dot^2*15*l2*l3*sin(theta1-theta_a) - theta2_dot^2*15*l1*l3*sin(theta2-theta_a) ...
     + theta_a_dot*(30*phi_dot*l3*sin(phi-theta_a)*(l1+l2) + 15*theta1_dot*l2*l3*sin(theta1 - theta_a) + 15*theta2_dot*l1*l3*sin(theta2-theta_a)) ...
     + 294*l3*sin(theta_a)); ...
      ...
     Q_dot*phi_dot*sin(2*phi)*(m2*l1^2/4 + (m3+m5)*(2*l1+l2)^2/4 + (m6+m7)*(l1-l2)^2/4 + m4*(l1+l2)^2)];
    
    %% inverse definition
    
    dX_inv_A(:,:,1)  = deriv(Mat1, phi);
    dX_inv_A(:,:,2)  = deriv(Mat1, phi_dot);
    dX_inv_A(:,:,3)  = deriv(Mat1, theta1);
    dX_inv_A(:,:,4)  = deriv(Mat1, theta1_dot);
    dX_inv_A(:,:,5)  = deriv(Mat1, theta2);
    dX_inv_A(:,:,6)  = deriv(Mat1, theta2_dot);
    dX_inv_A(:,:,7)  = deriv(Mat1, theta_a);
    dX_inv_A(:,:,8)  = deriv(Mat1, theta_a_dot);
    dX_inv_A(:,:,9)  = deriv(Mat1, Q);
    dX_inv_A(:,:,10) = deriv(Mat1, Q_dot);
    
    
    dX_inv_B(:,:,1)  = deriv(Mat2, phi);
    dX_inv_B(:,:,2)  = deriv(Mat2, phi_dot);
    dX_inv_B(:,:,3)  = deriv(Mat2, theta1);
    dX_inv_B(:,:,4)  = deriv(Mat2, theta1_dot);
    dX_inv_B(:,:,5)  = deriv(Mat2, theta2);
    dX_inv_B(:,:,6)  = deriv(Mat2, theta2_dot);
    dX_inv_B(:,:,7)  = deriv(Mat2, theta_a);
    dX_inv_B(:,:,8)  = deriv(Mat2, theta_a_dot);
    dX_inv_B(:,:,9)  = deriv(Mat2, Q);
    dX_inv_B(:,:,10) = deriv(Mat2, Q_dot);
 
   

%% A&B Calculations
dX_inv_A = subs(dX_inv_A,X,X_des');
Mat1_val = eval(subs(Mat1,X,X_des'));
Mat2_val = eval(subs(Mat2,X,X_des'));
inv_Mat1 = pinv(Mat1_val);
dX_inv_B = (subs(dX_inv_B,X,X_des'));


%% Matrix A Calculation
for i = 1:10
    A(i,:) = eval(-inv_Mat1*dX_inv_A(:,:,i)*inv_Mat1*(U_des' - Mat2_val) - inv_Mat1*dX_inv_B(:,:,i));
end

B = inv_Mat1;
toc
end
