% Prog_13b.m: Pinched hysteresis in the memristor
% Parameters.
eta=1;L=1;Roff=70;Ron=1;p=10;T=20;w0=0.6;
t=0:0.01:20;
% Solve the ODE.
options=odeset('RelTol',1e-12)
[t,w]=ode45(@(t,w) memristor(t,w,eta,Roff,Ron,p,T),t,w0,options);
% Voltage and current.
v=sin(2*pi*t/T);
i=v./(Roff-(Roff-Ron).*w);
% Plot pinched hysteresis curve in green.
plot(v,i,'g','LineWidth',1.5);
grid on;
xlabel('Voltage');
ylabel('Current');
title('Pinched Hysteresis in a Memristor');
set(gca,'FontSize',15);
function dwdt=memristor(t,w,eta,Roff,Ron,p,T)
dwdt=(eta*(1-(2*w-1)^(2*p))*sin(2*pi*t/T))/(Roff-(Roff-Ron)*w);
end
% End Prog_13b.m.