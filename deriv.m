function fout = deriv(f, g)
% deriv differentiates f with respect to g=g(t)
% the variable g=g(t) is a function of time
x = sym('x');
f1 = subs(f, g, x);
f2 = diff(f1, x);
fout = subs(f2, x, g);