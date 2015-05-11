%% Dynamical Equation Development
function torque = dyna_eqn(t_val)
%syms sym_phi sym_phi_dot th1 the1_dot the2 the2_dot the_a the_a_dot sym_Q sym_Q_dot t t1
syms ph dph ddph th1 dth1 ddth1 th2 dth2 ddth2 th_a dth_a ddth_a Qs dQs ddQs
syms t t1
global tm

sym_phi = sym('sym_phi(t)');
the1 = sym('theta1(t)');
the2 = sym('theta2(t)');
the_a = sym('theta_a(t)');
sym_Q = sym('Q(t1)');

sym_phi_dot = (diff(sym_phi,t));
the1_dot = (diff(the1,t));
the2_dot = (diff(the2,t));
the_a_dot = (diff(the_a,t));
sym_Q_dot = (diff(sym_Q,t1));

sym_phi_val = phi(t_val,'char');
the1_val = theta1(t_val,'char');
the2_val = theta2(t_val,'char');
the_a_val = theta_a(t_val,'char');
sym_Q_val = Q(t_val,'char');

sym_phi_dot_val = diff(sym_phi_val,t);
the1_dot_val = diff(the1_val,t);
the2_dot_val = diff(the2_val,t);
the_a_dot_val = diff(the_a_val,t);
sym_Q_dot_val = diff(sym_Q_val,t1);

%% Lagragian and derivatives
[KE,PE] = energy(t_val);
Lagrag = KE - PE;

%% New Method
dL_dphi  =  (deriv(Lagrag,sym_phi));
dL_dthe1  =  (deriv(Lagrag,the1));
dL_dthe2  =  (deriv(Lagrag,the2));
dL_dthe_a =  (deriv(Lagrag,the_a));
dL_dQ     =  (deriv(Lagrag,sym_Q));

dL_dphi_dot   = (deriv(Lagrag, sym_phi_dot));
dL_dthe1_dot  = (deriv(Lagrag, the1_dot));
dL_dthe2_dot  = (deriv(Lagrag, the2_dot));
dL_dthe_a_dot = (deriv(Lagrag, the_a_dot));
dL_dQ_dot     = (deriv(Lagrag, sym_Q_dot));

dL_dq = [dL_dphi; dL_dthe1; dL_dthe2; dL_dthe_a; dL_dQ];
dL_dq_dot = [dL_dphi_dot; dL_dthe1_dot; dL_dthe2_dot; dL_dthe_a_dot; dL_dQ_dot];

for i = 1: size(dL_dq_dot,1)
    ddL_dq_dot_dt_1(i,1) = deriv(dL_dq_dot(i), t);
end

for i = 1: size(dL_dq_dot,1)
    ddL_dq_dot_dt_2(i,1) = deriv(dL_dq_dot(i), t1);
end

ddL_dq_dot_dt = (ddL_dq_dot_dt_1 + ddL_dq_dot_dt_2);

% tau = (ddL_dq_dot_dt - dL_dq);
tau = simplify(ddL_dq_dot_dt - dL_dq);

%
tau = subs(tau, [diff(sym_phi,t, t), diff(the1,t, t), diff(the2,t, t), diff(the_a,t,t), diff(sym_Q,t1, t1)],...
    [ddph, ddth1, ddth2, ddth_a, ddQs]);

% tau = subs(tau,[sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
%     [ph, dph, th1, dth1, th2, dth2, th_a, dth_a, Qs, dQs]);

tau = subs(tau,[sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
    [phi, phi_dot, theta1, theta1_dot, theta2, theta2_dot, theta_a, theta_a_dot, Q, Q_dot]);


%tau = simplify(tau,'IgnoreAnalyticConstraints',true);
%% Torque Value evaluation
% % % % tau = subs(tau,[sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
% % % %                 [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val,sym_Q_val, sym_Q_dot_val]);
% % % % tau = subs(tau, t, t_val - floor(t_val/tm)*tm);
% % % % tau = subs(tau, t1 , t_val - floor(t_val/(2*tm))*2*tm);
% % % % tau = eval(tau);


%% Troque Arrangement
% Arranging the torques as [tor_xa(1); tor_xa(2); tor_xb(1); tor_xb(2); ... ;
% tor_xe(1); tor_xe(2)]; tor(1) ~ along y-axis (xz plane -- saggittal);
% tor(2) ~ x-axis (yz plane -- frontal) Torques at points 'p' and  'q' not
% considered

% if(rem(floor(t_val/tm),2) == 0)
%     torque = [tau(4); tau(5); tau(3); 0; 0; 0; tau(2); 0; 0; 0; 0; 0; tau(1); tau(5)];
% elseif(rem(floor(t_val/tm),2) == 1)
%     torque = [tau(1); tau(5); 0; 0; 0; 0; 0; 0; tau(2); 0; tau(3); 0; tau(4); tau(5)];
% end

torque = tau;
end



