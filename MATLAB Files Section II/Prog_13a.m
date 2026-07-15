% Prog_13a.m: Solve a nonlinear ODE.
syms i(t)
ode=diff(i,t,2)+5*diff(i,t)+6*i==10*cos(t);
% Initial conditions.
cond1=i(0)==0;
cond2=subs(diff(i,t),t,0)==0;
% Solve the ODE.
sol=dsolve(ode,[cond1,cond2]);
% Display the solution.
disp('i(t) =')
disp(simplify(sol))
% Plot the solution.
fplot(sol,[0 20],'LineWidth',1.5,'Color','r')
grid on
xlabel('Time')
ylabel('Current')
title('Current i(t) versus Time')
set(gca,'FontSize', 14)
% End Prog_13a.m.