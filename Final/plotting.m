figure
plot(X_des(:,1),X_des(:,3));
xlabel('time (s)','FontSize',18,'FontWeight','bold','Color','k')
ylabel('Value of Angular Speed (rad/s)','FontSize',18,'FontWeight','bold','Color','k')
hold on
scatter(X_obt(:,1),X_obt(:,3), 'r');
legend('Reference Value','System Response')
set(gca,'FontSize',15);