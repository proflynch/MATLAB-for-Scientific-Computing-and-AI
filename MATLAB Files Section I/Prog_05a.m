% Prog_05a.m: Solving Simple ODEs.
% See the book for more examples.
% Example 1.
syms x(t)
dsolve(diff(x,t)==-x/t)
% Example 2.
% An initial value problem.
dsolve(diff(x,t)==-x/t,x(1)==2)
% Example 3.
syms y(t)
dsolve(diff(y,t)+2*y(t)==2+exp(-t),y(0)==1)
% Example 4.
syms z(t)
Dz=diff(z);
dsolve(diff(z,2)+5*diff(z,t)+6*z(t)==10*sin(t),z(0)==0,Dz(0)==1)
% Example 5.
syms u(t) v(t) w(t)
deqns3=[diff(u,t)==u,diff(v,t)==v,diff(w,t)==-w];
ics=[u(0)==1,v(0)==2,w(0)==3];
dsolve(deqns3,ics)
% Example 6.
% Set up a 1-D system with initial condition 50, and run for 0<t<100.
deq1=@(t,x) x*(.1-.01*x);
[t,xa]=ode45(deq1,[0 100],50);
set(gca,'FontSize',20);
plot(t,xa(:,1),'Linewidth',2);xlabel('t');ylabel('x');
% End Prog_05a.m.
