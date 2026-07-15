% Prog_11c.m: Rikitake Dynamo Model of Geomagnetic Reversals.
% Parameters.
mu=1.0;a=1.0;
tspan=[0 500];
% Initial conditions [x y z].
Y0=[1;0.5;1];
% Solve ODE system.
[t,Y]=ode45(@(t,Y) rikitake(t,Y,mu,a),tspan,Y0);
% Extract variables.
x=Y(:,1);y=Y(:,2);z=Y(:,3);
% Plot magnetic variable versus time.
subplot(2,1,1)
plot(t,x,'r-','LineWidth',1.5)
hold on
plot(t,y,'b-','LineWidth',1.5)
plot(t,z,'k-','LineWidth',1.5)
xlabel('Time')
ylabel('State variables')
title('Rikitake Dynamo Variables')
legend('x','y','z')
set(gca,'FontSize',15)
grid on
% Three-dimensional phase portrait.
subplot(2,1,2)
plot3(x,y,z,'LineWidth',1)
xlabel('x')
ylabel('y')
zlabel('z')
title('Rikitake Dynamo Attractor')
set(gca,'FontSize',15)
grid on
view(45,25)
% Count polarity reversals.
reversals = sum(diff(sign(x)) ~= 0);
fprintf('Number of polarity reversals = %d\n', reversals);
% Rikitake System.
function dYdt=rikitake(~,Y,mu,a)
x=Y(1);y=Y(2);z=Y(3);
dx=-mu*x+y*z;
dy=-mu*y+(z-a)*x;
dz=1-x*y;
dYdt=[dx;dy;dz];
end
% End Prog_11c.m.