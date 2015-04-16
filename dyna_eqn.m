%% Dynamical Equation Development
function torque = dyna_eqn(t_val)
%syms sym_phi sym_phi_dot the1 the1_dot the2 the2_dot the_a the_a_dot sym_Q sym_Q_dot t t1
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

% sym_phi_val = phi(t_val,'char');
% the1_val = theta1(t_val,'char');
% the2_val = theta2(t_val,'char');
% the_a_val = theta_a(t_val,'char');
% sym_Q_val = Q(t_val,'char');
% 
% sym_phi_dot_val = diff(sym_phi_val,t);
% the1_dot_val = diff(the1_val,t);
% the2_dot_val = diff(the2_val,t);
% the_a_dot_val = diff(the_a_val,t);
% sym_Q_dot_val = diff(sym_Q_val,t1);

%% Lagragian and derivatives
[KE,PE] = energy(t_val);
Lagrag = KE - PE;

%% New Method
dL_dphi  =  simplify(deriv(Lagrag,sym_phi));
dL_dthe1  =  simplify(deriv(Lagrag,the1));
dL_dthe2  =  simplify(deriv(Lagrag,the2));
dL_dthe_a =  simplify(deriv(Lagrag,the_a));
dL_dQ     =  simplify(deriv(Lagrag,sym_Q));

dL_dphi_dot   = simplify(deriv(Lagrag, sym_phi_dot));
dL_dthe1_dot  = simplify(deriv(Lagrag, the1_dot));
dL_dthe2_dot  = simplify(deriv(Lagrag, the2_dot));
dL_dthe_a_dot = simplify(deriv(Lagrag, the_a_dot));
dL_dQ_dot     = simplify(deriv(Lagrag, sym_Q_dot));

dL_dq = [dL_dphi; dL_dthe1; dL_dthe2; dL_dthe_a; dL_dQ];
dL_dq_dot = [dL_dphi_dot; dL_dthe1_dot; dL_dthe2_dot; dL_dthe_a_dot; dL_dQ_dot];
% ddL_dq__dot_dt = [ddL_dphi_dot_dt; ddL_dthe1_dot_dt; ddL_dthe2_dot_dt; ddL_dthe_a_dot_dt; ddL_dQ_dot_dt];

% ddL_dphi_dot_dt = simplify(diff(dL_dphi_dot, t));
% ddL_dthe1_dot_dt = simplify(diff(dL_dthe1_dot, t));
% ddL_dthe2_dot_dt = simplify(diff(dL_dthe2_dot, t));
% ddL_dthe_a_dot_dt = simplify(diff(dL_dthe_a_dot, t));
% ddL_dQ_dot_dt = simplify(diff(dL_dQ_dot, t));

for i = 1: size(dL_dq_dot,1)
    ddL_dq_dot_dt_1(i,1) = deriv(dL_dq_dot(i), t); 
end

for i = 1: size(dL_dq_dot,1)
    ddL_dq_dot_dt_2(i,1) = deriv(dL_dq_dot(i), t1);
end

ddL_dq_dot_dt = simplify(ddL_dq_dot_dt_1 + ddL_dq_dot_dt_2);

tau = ddL_dq_dot_dt - dL_dq;

% q1 = {'sym_phi', diff(sym_phi,t), diff(sym_phi,t), 'the1', diff(the1,t), diff(the1,t), ...
%         'the2', diff(the2,t), diff(the2,t), 'the_a', diff(the_a,t), diff(the_a,t), ...
%         'sym_Q', diff(Q(t1),t1), diff(Q(t1),t1)};
%     
% q2 = {'phi', 'dphi','ddphi', 'theta1', 'dtheta1', 'ddtheta1', 'theta2', 'dtheta2', 'ddtheta2', 'theta_a', 'dtheta_a', 'ddtheta_A', 'Q' ,'dQ', 'ddQ'};
% 
% tau = subs(tau, q1, q2);

%% New Method End

%% Old Method
% 
% % %% Derivates wrt q
% % dL_dphi  =  deriv(Lagrag,'sym_phi');
% % dL_dthe1  =  deriv(Lagrag,'the1');
% % dL_dthe2  =  deriv(Lagrag,'the2');
% % dL_dthe_a =  deriv(Lagrag,'the_a');
% % dL_dQ     =  deriv(Lagrag,'sym_Q');
% % % % % 
% % dL_dq = [dL_dphi; dL_dthe1; dL_dthe2; dL_dthe_a; dL_dQ];
% % dL_dq = subs(dL_dq,[sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
% %         [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val,sym_Q_val, sym_Q_dot_val]);
% % % % dL_dq = subs(dL_dq, t, t_val - floor(t_val/tm)*tm);
% % % % dL_dq = subs(dL_dq, t1 , t_val - floor(t_val/(2*tm))*2*tm);
% % % % dL_dq = eval(dL_dq);


%% Derivative wrt q_dot
% dL_dphi_dot   = deriv(Lagrag,'sym_phi_dot');
% dL_dthe1_dot  = deriv(Lagrag,'the1_dot');
% dL_dthe2_dot  = deriv(Lagrag,'the2_dot');
% dL_dthe_a_dot = deriv(Lagrag,'the_a_dot');
% dL_dQ_dot     = deriv(Lagrag,'sym_Q_dot');
% 
% dL_dq_dot = [dL_dphi_dot; dL_dthe1_dot; dL_dthe2_dot; dL_dthe_a_dot; dL_dQ_dot];
% % % dL_dq_dot = subs(dL_dq_dot, [sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
% %              [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val, sym_Q_val, sym_Q_dot_val]);

%% Second derivative wrt to time
% % for i = 1: size(dL_dq_dot,1)
% %     ddL_dq_dot_dt_1(i,1) = deriv(dL_dq_dot(i), 't'); 
% % end
% % 
% % for i = 1: size(dL_dq_dot,1)
% %     ddL_dq_dot_dt_2(i,1) = deriv(dL_dq_dot(i), 't1');
% % end
% % 
% % ddL_dq_dot_dt = ddL_dq_dot_dt_1 + ddL_dq_dot_dt_2 ;

% % % % % ddL_dq_dot_dt = subs(ddL_dq_dot_dt,[sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
% % % % %                 [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val,sym_Q_val, sym_Q_dot_val]);
% % % % % ddL_dq_dot_dt = subs(ddL_dq_dot_dt, t, t_val - floor(t_val/tm)*tm);
% % % % % ddL_dq_dot_dt = subs(ddL_dq_dot_dt, t1 , t_val - floor(t_val/(2*tm))*2*tm);
% % % % % ddL_dq_dot_dt = eval(ddL_dq_dot_dt);
% 
% 
% % dL_dthe1_dot = subs(dL_dthe1_dot, [sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
% %     [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val, sym_Q_val, sym_Q_dot_val]);
% % dL_dthe2_dot = subs(dL_dthe2_dot, [sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
% %     [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val, sym_Q_val, sym_Q_dot_val]);
% % dL_dthe_a_dot = subs(dL_dthe_a_dot, [sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
% %     [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val, sym_Q_val, sym_Q_dot_val]);
% % dL_dQ_dot = subs(dL_dQ_dot, [sym_phi, sym_phi_dot, the1, the1_dot, the2, the2_dot, the_a, the_a_dot, sym_Q, sym_Q_dot], ...
% %     [sym_phi_val, sym_phi_dot_val, the1_val, the1_dot_val, the2_val, the2_dot_val, the_a_val, the_a_dot_val, sym_Q_val, sym_Q_dot_val]);
% 
% %%
% % % Derivative wrt time
% % ddL_dphi_dot_dt = deriv(dL_dphi_dot, 't');
% % ddL_dthe1_dot_dt = deriv(dL_dthe1_dot, 't');
% % ddL_dthe2_dot_dt = deriv(dL_dthe2_dot, 't');
% % ddL_dthe_a_dot_dt = deriv(dL_dthe_a_dot, 't');
% % ddL_dQ_dot_dt = deriv(dL_dQ_dot, 't');
% 
% % ddL_dq_dt_1 = [ddL_dphi_dot_dt, ddL_dthe1_dot_dt, ddL_dthe2_dot_dt, ddL_dthe_a_dot_dt, ddL_dQ_dot_dt]';
% % ddL_dq_dt =   eval(subs(ddL_dq_dt_1, t, t_val));
% % %% Equations
% % dL_dq = [dL_dphi, dL_dthe1, dL_dthe2, dL_dthe_a, dL_dQ]';
% % ddL_dq_dt = [ddL_dphi_dot_dt, ddL_dthe1_dot_dt, ddL_dthe2_dot_dt, ddL_dthe_a_dot_dt, ddL_dQ_dot_dt]';
% 
% tau = ddL_dq_dot_dt - dL_dq;
% tau = dL_dq_dot;

%tau =   eval(subs(sym_tau, t, t_val))
% tau_h = matlabFunction(sym_tau)


% torque = [tau(4),tau(5), tau(3), 0, tau(2), 0, 0, 0, 0, 0, tau(1),tau(5)]';
torque = tau;
end
