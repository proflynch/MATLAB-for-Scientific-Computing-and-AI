% Prog_13d.m: Two-Mass, Three-Spring System
% Parameters
m1=1;m2=2;k1=1;k2=2;k3=3;
% Initial Conditions.
x10=0;y10=0;x20=1;y20=0;
X0=[x10;y10;x20;y20];
tmax=20;
n=1000;
tspan=linspace(0,tmax,n);
% Solve ODE.
[t,X]=ode45(@(t,X) Mass_Spring(t,X,m1,m2,k1,k2,k3),tspan,X0);
% Extract Results.
x1=X(:,1);
y1=X(:,2);
x2=X(:,3);
y2=X(:,4);
figure(1)
plot(t,x1,'b','LineWidth',1.5)
hold on
plot(t,x2,'r','LineWidth',1.5)
hold off
xlabel('Time')
ylabel('Displacement')
title('Two-Mass, Three-Spring')
legend('x_1','x_2','Location','best')
set(gca,'FontSize',15)
grid on
% Differential Equation Function.
function dXdt = Mass_Spring(~,X,m1,m2,k1,k2,k3)
    x1=X(1);
    y1=X(2);
    x2=X(3);
    y2=X(4);
    dx1=y1;
    dy1=-(k1*x1+k2*(x1-x2))/m1;
    dx2=y2;
    dy2=-(k2*(x2-x1)+k3*x2)/m2;
    dXdt=[dx1;dy1;dx2;dy2];
end
% End Prog_13d.m.