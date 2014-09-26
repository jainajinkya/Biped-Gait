function line = makeLine(start,goal)

m = (goal(2)-start(2))/(goal(1)- start(1));
xs = linspace(start(1),goal(1))';
ys = m*(xs - start(1)*ones(100,1)) + start(2)*ones(100,1);

line = [xs ys];
end