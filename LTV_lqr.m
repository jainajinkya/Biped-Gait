function [S] = LTV_lqr(A,B,Q,R)


A = jacobian(f,x);
B = jacobian(f,u);


[K,S,e] = LQR(A,B,Q,R)

end