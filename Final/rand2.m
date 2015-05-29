p = '(m_7 (((l_3 theta_a_dot sin(the_a))/2 + (l_2 theta_1_dot sin(theta_1))/2 + (l_1 theta_2_dot sin(theta_2))/2 + phi_dot sin(phi) (l_1 + l_2))^2 + ((l_3 theta_a_dot cos(the_a))/2 + (l_2 theta_1_dot cos(theta_1))/2 + (l_1 theta_2_dot cos(theta_2))/2 + phi_dot cos(phi) (l_1 + l_2))^2 + (Q_dot^2 cos(phi)^2 (l_1 - l_2)^2)/4))/2 + (Q_dot^2 m_7 (h^2 + l_4^2))/24 + (m_7 (h^2 + l_3^2) (phi_dot + theta_1_dot + theta_2_dot + theta_a_dot) (phi_dot/2 + theta_1_dot/2 + theta_2_dot/2 + theta_a_dot/2))/12';
% p1 = strrep(p1,'','');
p1 = strrep(p,'phi','\phi');
p1 = strrep(p1,'phi_dot','\dot{\phi}');
p1 = strrep(p1,'theta_1','\theta_1');
p1 = strrep(p1,'theta_1_dot','\dot{\theta_1}');
p1 = strrep(p1,'theta_2','\theta_2');
p1 = strrep(p1,'theta_2_dot','\dot{\theta_2}');
p1 = strrep(p1,'theta_a','\theta_a');
p1 = strrep(p1,'theta_a_dot','\dot{\theta_a}');
p1 = strrep(p1,'Q_dot','\dot{Q}');
p1


% p1 = strrep(p,'phi_dot','\dot{\phi}');
% p1 = strrep(p,'phi_dot','\dot{\phi}');