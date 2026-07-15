% Prog_05g.m: Fitness-fatigue-performance model.
clear; clc;
set(groot,'DefaultAxesFontSize',15);
set(groot,'DefaultTextFontSize',15);
% Parameters.
tau=5;        % Time delay is 5 days.
k_f=0.03;     % Fitness gain.
k_rf=0.01;    % Fitness decay.
k_r=0.04;     % Fatigue gain.
k_rr=0.15;    % Fatigue decay.
alpha = 1.5;  % Fatigue weight.
tspan = [0 200];
lags = tau;
% Training load.
u = @(t) 50+20*sin(2*pi*t/14);
% DDE function WITH parameter passing.
dde_fun=@(t,y,Z) fitness_fatigue_dde(t,y,Z,k_f,k_rf,k_r,k_rr,u);
history=@(t) [0;0];
sol=dde23(dde_fun,lags,history,tspan); % DDE Solver.
t=linspace(0,200,1000);
y=deval(sol,t);
F=y(1,:);
G=y(2,:);
P=F-alpha*G;
figure;
subplot(3,1,1)
plot(t,u(t),'k','LineWidth',2)
axis([0 200 20 80])
title('Training Load')
subplot(3,1,2)
plot(t,F,'b',t,G,'r','LineWidth',2)
legend('Fitness','Fatigue','Location','northwest')
title('States with Delay')
subplot(3,1,3)
plot(t,P,'Color',[0,0.4,0],'LineWidth',2)
title('Performance')
xlabel('Time (days)')
function dydt=fitness_fatigue_dde(t,y,Z,k_f,k_rf,k_r,k_rr,u)
F=y(1);
G_tau=Z(2,1);   % Delayed fatigue.
u_t=u(t);
dF=k_f*u_t-k_rf*F;
dG=k_r*u_t-k_rr*G_tau;
dydt=[dF; dG];
end
% End Prog_05g.m.