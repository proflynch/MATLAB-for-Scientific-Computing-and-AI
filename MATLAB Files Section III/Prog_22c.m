% Prog_22c.m: FitzHugh-Nagumo SR Flip-Flop.
% Parameters.
theta=0.1;gamma=0.1;epsilon=0.1;
m=-100;c=60;
Ic=1;w1=0.5;x1=-1;
% Time span
tspan=0:0.1:3000;
% Initial conditions.
X0=[0.01 0.01 0.01 0.01 0 0 0 0];
% Solve ODE.
[t,X]=ode45(@(t,X) FN_ODEs(t,X,theta,gamma,epsilon,m,c,w1,x1,Ic),...
              tspan,X0);
% Extract variables.
u1=X(:,1);v1=X(:,2);u2=X(:,3);v2=X(:,4);
u3=X(:,5);v3=X(:,6);u4=X(:,7);v4=X(:,8);
figure;
subplot(4,1,1)
plot(t,u1,'b','LineWidth',1.5)
ylim([-1 1.5])
ylabel('I_1')
title('FitzHugh-Nagumo SR Flip-Flop')
set(gca,'FontSize',20)
subplot(4,1,2)
plot(t,u2,'b','LineWidth',1.5)
ylim([-1 1.5])
ylabel('I_2')
set(gca,'FontSize',20)
subplot(4,1,3)
plot(t,u3,'g','LineWidth',1.5)
ylim([-1 1.5])
ylabel('O_1')
set(gca,'FontSize',20)
subplot(4,1,4)
plot(t,u4,'g','LineWidth',1.5)
ylim([-1 1.5])
ylabel('O_2')
xlabel('Time')
set(gca,'FontSize',20)
% ODE Function.
function dX=FN_ODEs(t,X,theta,gamma,epsilon,m,c,w1,x1,Ic)
u1=X(1);v1=X(2);u2=X(3);v2=X(4);
u3=X(5);v3=X(6);u4=X(7);v4=X(8);
% Inputs.
I1=Input1(t);I2 = Input2(t);
Ic1=Ic*(t>10);Ic2=Ic*(t>0);
% FitzHugh-Nagumo equations.
du1=-u1*(u1-theta)*(u1-1)-v1+I1;
dv1=epsilon*(u1-gamma*v1);
du2=-u2*(u2-theta)*(u2-1)-v2+I2;
dv2=epsilon*(u2-gamma*v2);
du3=-u3*(u3-theta)*(u3-1)-v3 ...
      +w1/(1+exp(m*v1+c)) ...
      +x1/(1+exp(m*v4+c)) ...
      +Ic1;
dv3=epsilon*(u3-gamma*v3);
du4=-u4*(u4-theta)*(u4-1)-v4 ...
      +0.45/(1+exp(m*v2+c)) ...
      +x1/(1+exp(m*v3+c)) ...
      +Ic2;
dv4=epsilon*(u4-gamma*v4);
dX = [du1;dv1;du2;dv2;du3;dv3;du4;dv4];
end
% Input Functions.
function y=Input1(t)
y=(t>1000)-(t>1500);
end
function y=Input2(t)
y=(t>2000)-(t>2500);
end
% End Prog_22c.m.