t_phi = (m7*(2*sym_phi_dot*sin(sym_phi)*(l1 + l2)*((l2*the1_dot*cos(the1))/2 + (l1*the2_dot*cos(the2))/2 + (l3*the_a_dot*cos(the_a))/2 + ...
    sym_phi_dot*cos(sym_phi)*(l1 + l2)) - 2*sym_phi_dot*cos(sym_phi)*(l1 + l2)*((l2*the1_dot*sin(the1))/2 + (l1*the2_dot*sin(the2))/2 + ...
    (l3*the_a_dot*sin(the_a))/2 + sym_phi_dot*sin(sym_phi)*(l1 + l2)) + (sym_Q_dot^2*cos(sym_phi)*sin(sym_phi)*(l1 - l2)^2)/2))/2 + ...
    (m5*(2*sym_phi_dot*sin(sym_phi)*(l1 + l2)*((l2*the1_dot*cos(the1))/2 + sym_phi_dot*cos(sym_phi)*(l1 + l2))...
    - 2*sym_phi_dot*cos(sym_phi)*(l1 + l2)*((l2*the1_dot*sin(the1))/2 + sym_phi_dot*sin(sym_phi)*(l1 + l2)) + ...
    2*sym_Q_dot^2*cos(sym_phi)*sin(sym_phi)*(l1 + l2/2)^2))/2 + (m6*(2*sym_phi_dot*sin(sym_phi)*(l1 + l2)*((l2*the1_dot*cos(the1))/2 + ...
    (l1*the2_dot*cos(the2))/2 + sym_phi_dot*cos(sym_phi)*(l1 + l2)) - 2*sym_phi_dot*cos(sym_phi)*(l1 + l2)*((l2*the1_dot*sin(the1))/2 + ...
    (l1*the2_dot*sin(the2))/2 + sym_phi_dot*sin(sym_phi)*(l1 + l2)) + (sym_Q_dot^2*cos(sym_phi)*sin(sym_phi)*(l1 - l2)^2)/2))/2 - ...
    (49*l1*m2*sin(sym_phi))/10 - (49*m3*sin(sym_phi)*(l1 + l2/2))/5 - (49*m4*sin(sym_phi)*(l1 + l2))/5 - (49*m5*sin(sym_phi)*(l1 + l2))/5 - ...
    (49*m6*sin(sym_phi)*(l1 + l2))/5 - (49*m7*sin(sym_phi)*(l1 + l2))/5 + (l1^2*m2*sym_Q_dot^2*cos(sym_phi)*sin(sym_phi))/3 + ...
    (l2^2*m3*sym_Q_dot^2*cos(sym_phi)*sin(sym_phi))/12 + m3*sym_Q_dot^2*cos(sym_phi)*sin(sym_phi)*(l1 + l2/2)^2 + ...
    m4*sym_Q_dot^2*cos(sym_phi)*sin(sym_phi)*(l1 + l2)^2;


(m6*(2*sin(sym_phi)*(l1 + l2)*((l2*the1_dot*sin(the1))/2 + (l1*the2_dot*sin(the2))/2 + sym_phi_dot*sin(sym_phi)*(l1 + l2)) + ...
    2*cos(sym_phi)*(l1 + l2)*((l2*the1_dot*cos(the1))/2 + (l1*the2_dot*cos(the2))/2 + sym_phi_dot*cos(sym_phi)*(l1 + l2))))/2 + ...
    (m7*(2*sin(sym_phi)*(l1 + l2)*((l2*the1_dot*sin(the1))/2 + (l1*the2_dot*sin(the2))/2 + (l3*the_a_dot*sin(the_a))/2 + ...
    sym_phi_dot*sin(sym_phi)*(l1 + l2)) + 2*cos(sym_phi)*(l1 + l2)*((l2*the1_dot*cos(the1))/2 + (l1*the2_dot*cos(the2))/2 + ...
    (l3*the_a_dot*cos(the_a))/2 + sym_phi_dot*cos(sym_phi)*(l1 + l2))))/2 + (m5*(2*cos(sym_phi)*(l1 + l2)*((l2*the1_dot*cos(the1))/2 + ...
    sym_phi_dot*cos(sym_phi)*(l1 + l2)) + 2*sin(sym_phi)*(l1 + l2)*((l2*the1_dot*sin(the1))/2 + sym_phi_dot*sin(sym_phi)*(l1 + l2))))/2 + ...
    (l1^2*m2*sym_phi_dot)/4 + m3*sym_phi_dot*(l1 + l2/2)^2 + m4*sym_phi_dot*(l1 + l2)^2 + (l1^2*m2*sym_phi_dot*cos(sym_Q)^2)/12 + ...
    (l2^2*m3*sym_phi_dot*cos(sym_Q)^2)/12
    
%%
(m5*(l2*sin(the1)*((l2*the1_dot*sin(the1))/2 + sym_phi_dot*sin(sym_phi)*(l1 + l2)) + l2*cos(the1)*((l2*the1_dot*cos(the1))/2 + ...
    sym_phi_dot*cos(sym_phi)*(l1 + l2))))/2 + (m6*(l2*cos(the1)*((l2*the1_dot*cos(the1))/2 + (l1*the2_dot*cos(the2))/2 + ...
    sym_phi_dot*cos(sym_phi)*(l1 + l2)) + l2*sin(the1)*((l2*the1_dot*sin(the1))/2 + (l1*the2_dot*sin(the2))/2 + ...
    sym_phi_dot*sin(sym_phi)*(l1 + l2))))/2 + (m7*(l2*cos(the1)*((l2*the1_dot*cos(the1))/2 + (l1*the2_dot*cos(the2))/2 + ...
    (l3*the_a_dot*cos(the_a))/2 + sym_phi_dot*cos(sym_phi)*(l1 + l2)) + l2*sin(the1)*((l2*the1_dot*sin(the1))/2 + (l1*the2_dot*sin(the2))/2 + ...
    (l3*the_a_dot*sin(the_a))/2 + sym_phi_dot*sin(sym_phi)*(l1 + l2))))/2 + (l2^2*m5*the1_dot*cos(sym_Q)^2)/12

%%
(m6*(l1*cos(the2)*((l2*the1_dot*cos(the1))/2 + (l1*the2_dot*cos(the2))/2 + sym_phi_dot*cos(sym_phi)*(l1 + l2)) + ...
    l1*sin(the2)*((l2*the1_dot*sin(the1))/2 + (l1*the2_dot*sin(the2))/2 + sym_phi_dot*sin(sym_phi)*(l1 + l2))))/2 + ...
    (m7*(l1*cos(the2)*((l2*the1_dot*cos(the1))/2 + (l1*the2_dot*cos(the2))/2 + (l3*the_a_dot*cos(the_a))/2 + sym_phi_dot*cos(sym_phi)*(l1 + l2)) + ...
    l1*sin(the2)*((l2*the1_dot*sin(the1))/2 + (l1*the2_dot*sin(the2))/2 + (l3*the_a_dot*sin(the_a))/2 + sym_phi_dot*sin(sym_phi)*(l1 + l2))))/2 + ...
    (l1^2*m6*the2_dot*cos(sym_Q)^2)/12

%%
(m7*(l3*cos(the_a)*((l2*the1_dot*cos(the1))/2 + (l1*the2_dot*cos(the2))/2 + (l3*the_a_dot*cos(the_a))/2 + sym_phi_dot*cos(sym_phi)*(l1 + l2)) + ...
    l3*sin(the_a)*((l2*the1_dot*sin(the1))/2 + (l1*the2_dot*sin(the2))/2 + (l3*the_a_dot*sin(the_a))/2 + sym_phi_dot*sin(sym_phi)*(l1 + l2))))/2 + ...
    (l3^2*m7*the_a_dot)/12

%%
(l5^2*m4*sym_Q_dot)/12 + m4*sym_Q_dot*cos(sym_phi)^2*(l1 + l2)^2 + (l1^2*m2*sym_Q_dot*cos(sym_phi)^2)/3 + (l2^2*m3*sym_Q_dot*cos(sym_phi)^2)/12 + ...
    (l2^2*m5*sym_Q_dot*cos(the1)^2)/12 + (l1^2*m6*sym_Q_dot*cos(the2)^2)/12 + m3*sym_Q_dot*cos(sym_phi)^2*(l1 + l2/2)^2 + ...
    (m6*sym_Q_dot*cos(sym_phi)^2*(l1 - l2)^2)/4 + m5*sym_Q_dot*cos(sym_phi)^2*(l1 + l2/2)^2 + (m7*sym_Q_dot*cos(sym_phi)^2*(l1 - l2)^2)/4