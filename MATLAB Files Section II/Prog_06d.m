% Prog_06d.M: Simple SIR Epidemic Model
beta=0.5;gamma=0.1;
% Initial conditions.
S0=999;
I0=1;
R0=0;
N=1000;
tmax=100;
n=1000;
tspan=linspace(0,tmax,n);
% Solve the system using ode45.
[t,X]=ode45(@(t,X) SIR_Model(t,X,beta,gamma,N),tspan,[S0 I0 R0]);
S=X(:,1);I=X(:,2);R=X(:,3);
plot(t,S,'LineWidth',2)
hold on
plot(t,I,'LineWidth',2)
plot(t,R,'LineWidth',2)
xlabel('Time (days)')
ylabel('Populations')
title('Susceptible-Infected-Recovered (SIR) Epidemic Model')
legend('S', 'I', 'R')
set(gca,'FontSize',20)
grid on
function dXdt = SIR_Model(~, X, beta, gamma, N)
S=X(1);
I=X(2);
R=X(3);
dS=-beta*S*I/N;
dI=beta*S*I/N-gamma*I;
dR=gamma*I;
dXdt=[dS;dI;dR];
end
% End Prog_06d.m.
