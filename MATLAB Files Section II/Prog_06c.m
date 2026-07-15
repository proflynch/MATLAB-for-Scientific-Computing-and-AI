% Prog_06c.m: Plot time series and a phase portrait.
tspan = linspace(0, 200, 1000);
% Initial conditions: x0=7,y0=0.1.
Sys0=[7;0.1];
% Solve the system using ode45.
[t,X]=ode45(@Holling_Tanner,tspan,Sys0);
% Extract solutions.
x=X(:,1);y=X(:,2);
figure('Position',[100,100,1200,400]);
% Time series.
subplot(1,2,1)
plot(t,x,'r-','LineWidth',2);
hold on;
plot(t,y,'b-','LineWidth',2);
set(gca,'FontSize',15)
title('Time Series');
xlabel('time');
ylabel('Population');
legend('prey','predator');
grid on;
% Phase Portrait.
subplot(1,2,2)
plot(x,y,'b-','LineWidth',2);
set(gca,'FontSize',15)
xlabel('x');
ylabel('y');
title('Phase Portrait');
grid on;
function dXdt=Holling_Tanner(~, X)
x=X(1);y=X(2);
dxdt=x*(1-x/7)-6*x*y/(7+7*x);
dydt=0.2*y*(1-0.5*y/x);
dXdt=[dxdt;dydt];
end
% End of Prog_06c.m.