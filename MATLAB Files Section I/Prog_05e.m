% Prog_05e.m: Phase portraits for nonautonomous systems.
% Phase portrait for the Duffing system.
figure
deq=@(t,x) [x(2);x(1)-0.3*x(2)-(x(1))^3+0.5*cos(1.25*t)];
options=odeset('RelTol',1e-4,'AbsTol',1e-4);
[t,xx]=ode45(deq,[0 200],[1,0],options);
subplot(2,1,1)
plot(t,xx(:,1),t,xx(:,2))
legend('x(t)','$\dot{x}(t)$','Interpreter','latex')
set(gca,'FontSize',15);
axis([0 200 -2 4])
xlabel('t')
ylabel('x(t),y(t)')
subplot(2,1,2)
plot(xx(:,1),xx(:,2))
set(gca,'FontSize',15);
axis([-2 2 -2 2])
xlabel('x(t)')
ylabel('y(t)')
% End of Prog_05e.m.
