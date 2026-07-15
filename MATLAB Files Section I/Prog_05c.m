% Prog_05c.m: Chemistry: A -> B -> C.
figure;clear;
tspan=[0 25];
sys=@(t,y) [-1.0*y(1);
            1.0*y(1)-0.5*y(2);
            0.5*y(2)];
[t,y]=ode45(sys,tspan,[1;0;0]);
figure;
plot(t,y(:,1),'r',t,y(:,2),'g',t,y(:,3),'b','LineWidth',2);
legend('|A|','|B|','|C|');
title('Chemistry: Consecutive Reaction');
xlabel('Time'); ylabel('Concentration');
grid on;
set(gca,'FontSize',20);
% End Prog_05c.m.