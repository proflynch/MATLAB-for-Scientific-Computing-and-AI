% Prog_19c.m: Lactate Dynamics During Exercise.
% Comparison of ODE and DDE Models.
% Model Parameters.
I=1.2;          % Exercise intensity.
alpha=2.0;      % Lactate production coefficient.
beta =0.5;      % Lactate clearance coefficient.
gamma=0.08;     % Anaerobic depletion coefficient.
delta=0.02;     % Anaerobic recovery coefficient.
% Initial Conditions.
L0=1;            % Initial blood lactate (mmol/L).
A0=100;          % Initial anaerobic capacity (%).
Y0=[L0 A0];
tspan=[0 60];
% ODE Model.
% Y(1)=lactate concentration.
% Y(2)=anaerobic capacity.
odefun=@(t,Y)[...
    alpha*I*Y(2)/100-beta*Y(1);
    -gamma*I*Y(2)+delta*(100-Y(2))
    ];
[t,Y]=ode45(odefun,tspan,Y0);
L_ODE=Y(:,1);
A_ODE=Y(:,2);
% DDE Model.
% Physiological delay (minutes).
tau=3;
% History before exercise begins.
history=[L0 A0];
% Delayed metabolic response.
% Z(1)=delayed lactate.
% Z(2)=delayed anaerobic capacity.
ddefun=@(t,Y,Z)[...
    alpha*I*Z(2)/100 - beta*Y(1);
    -gamma*I*Z(2) + delta*(100-Y(2))
    ];
sol=dde23(ddefun,tau,history,tspan);
L_DDE = sol.y(1,:);
A_DDE = sol.y(2,:);
figure
% Lactate response.
subplot(1,2,1)
plot(t,L_ODE,'b','LineWidth',2)
hold on
plot(sol.x,L_DDE,'r--','LineWidth',2)
xlabel('Time (min)')
ylabel('Blood Lactate (mmol/L)')
title('Lactate Accumulation')
legend('ODE','DDE','Location','best')
grid on
set(gca,'FontSize',15)
% Anaerobic capacity response.
subplot(1,2,2)
plot(t,A_ODE,'b','LineWidth',2)
hold on
plot(sol.x,A_DDE,'r--','LineWidth',2)
xlabel('Time (min)')
ylabel('Anaerobic Capacity (%)')
title('Anaerobic Energy Availability')
legend('ODE','DDE','Location','best')
grid on
sgtitle('Metabolic Response During High-Intensity Exercise',...
    'FontSize',20)
set(gca,'FontSize',15)
% End Prog_19c.m.