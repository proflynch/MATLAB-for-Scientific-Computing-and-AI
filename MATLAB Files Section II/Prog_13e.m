% Prog_13e.m: Bifurcation diagram for the Duffing equation.
Max=4000;
step=1e-4;
interval=Max*step;
rup=zeros(Max,1);
rdown=zeros(Max,1);
T=2*pi/1.25;
tspan=[0 T];
options=odeset('RelTol',1e-5,'AbsTol',1e-7);
Duffing=@(t,x,Gamma) [ ...
    x(2);
    x(1)-0.1*x(2)-x(1)^3 + Gamma*cos(1.25*t)];
a=1;b=0;
% Ramp up.
for n=1:Max
    Gamma=n*step;
    [~,x]=ode45(@(t,x) Duffing(t,x,Gamma),tspan,[a;b],options);
    a=x(end,1);
    b=x(end,2);
    rup(n)=hypot(a,b);
end
% Ramp down.
for n=1:Max
    Gamma=interval-n*step;
    [~,x]=ode45(@(t,x) Duffing(t,x,Gamma),tspan,[a;b],options);
    a=x(end,1);
    b=x(end,2);
    rdown(n)=hypot(a,b);
end
GammaVals=step*(1:Max);
figure
plot(GammaVals,rup,'r.')
hold on
plot(interval-GammaVals,rdown,'b.')
hold off
axis([0 interval 0 1.5])
xlabel('\Gamma')
ylabel('r')
set(gca,'FontSize',20)
% End Prog_13e.m.