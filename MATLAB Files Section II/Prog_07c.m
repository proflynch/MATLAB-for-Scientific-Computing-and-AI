% Prog_07c.m: Belousov-Zhabotinsky (B-Z) Reaction Simulation.
q=3.1746e-5;fpar=1;eps1 =0.0099;eps2=2.4802e-5;
% Initial conditions.
x0=0;y0=0;z0=0.1;
% Maximum time point and total number of time points.
tmax=50;n=10000;
% Time vector.
t=linspace(0,tmax,n);
% Initial condition vector.
X0=[x0 y0 z0];
% Solve the system using ode45.
[t,X]=ode45(@(t,X) BZReaction(t,X,q,fpar,eps1,eps2),t,X0);
% Extract solutions.
x=X(:,1);y=X(:,2);z=X(:,3);
% Plot time series.
figure('Position', [100 100 1000 300]);
subplot(1,3,1);
plot(t,x,'b-');
title('Relative concentration bromous acid');
xlabel('Time');
ylabel('x(t)');
grid on;
subplot(1,3,2);
plot(t,y,'r-');
title('Relative concentration bromide ions');
xlabel('Time');
ylabel('y(t)');
grid on;
subplot(1,3,3);
plot(t,z,'k-');
title('Relative concentration cerium ions');
xlabel('Time');
ylabel('z(t)');
grid on;
function dXdt=BZReaction(~,X,q,fpar,eps1,eps2)
x = X(1);
y = X(2);
z = X(3);
dx=(q*y-x*y+x*(1-x))/eps1;
dy=(-q*y-x*y+fpar*z)/eps2;
dz=x-z;
dXdt=[dx;dy;dz];
end
% End Prog_07c.m.