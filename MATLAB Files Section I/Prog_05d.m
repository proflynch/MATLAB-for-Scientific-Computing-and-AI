% Prog_05d.m: River pollution with O2 depletion model.
tspan = [0 50]; % In days.
% Initial conditions:
x0=[8;9]; % P(0) and O(0).
[t,x]=ode45(@pollution,tspan,x0);
P=x(:,1);O2=x(:,2);
figure
subplot(2,1,1) % 2 subplots, 1 row, 1 col.
plot(t,P,'r','LineWidth',2)
ylabel('P (mg/L)')
title('River Pollution Oxygen Sag Model')
set(gca,'FontSize',20)
grid on
subplot(2,1,2) % 2 subplots, 1 row , 2 col.
plot(t,O2,'b','LineWidth',2)
ylabel('O2 (mg/L)');
xlabel('Time (days)');
set(gca,'FontSize',20);
grid on
% =========================
function dxdt = pollution(~,x)
    P=x(1);O2=x(2);
    % Parameters.
    kd=0.2;      % deoxygenation rate.
    kr=0.35;     % reaeration rate.
    O2sat=10;    % saturation.
    dP=-kd*P;
    dO2=kr*(O2sat-O2)-kd*P;
    dxdt=[dP;dO2];
end
% End Prog_05d.m.