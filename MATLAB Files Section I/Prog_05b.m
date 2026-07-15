% Prog_05b.m: Simple drug absorption model.
ka=1.2;ke=0.4;    
% Initial conditions.
Ag0=100;Ab0=0; 
y0=[Ag0;Ab0];
tspan=[0 24];
% Solve the ODE.
[t,y]=ode45(@(t,y) drugModel(t,y,ka,ke),tspan,y0);
% Extract solutions.
Ag=y(:,1);Ab=y(:,2);
% Plot.
figure;
plot(t,Ag,'b-','LineWidth',2);
hold on;
plot(t,Ab,'r-','LineWidth',2);
xlabel('Time (hours)');
ylabel('Drug Amount (mg)');
legend('Gut','Bloodstream');
title('Simple Drug Absorption Model');
grid on;
% ODE function.
function dydt=drugModel(~,y,ka,ke)
Ag=y(1);Ab=y(2);
dAgdt=-ka*Ag;
dAbdt=ka*Ag-ke*Ab;
dydt=[dAgdt;dAbdt];
end
set(gca,'FontSize',20);
% End Prog_05b.m.