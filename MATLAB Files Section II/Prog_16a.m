% Prog_16a.m: Euler's Method for an IVP.
f=@(t,y) y*(1-y);
h=0.1;y0=0.1;tmax=1;
t=0:h:tmax;steps=1/h;
y=zeros(1,steps+1);
y(1)=y0;
for n=1:steps
    y(n+1)=y(n)+h*f(t(n),y(n));
end
ysol=1./(1+9*exp(-t));
plot(t,y,'.-','MarkerSize',20);
hold on
plot(t,ysol,'r');
grid on;grid minor;
legend('Numerical Solution','Analytical Solution', ...
    'Location','northwest')
set(gca,'FontSize',20);
xticks(0:.1:1)
xlabel('t');
ylabel('y(t)');
% End Prog_16a.m.