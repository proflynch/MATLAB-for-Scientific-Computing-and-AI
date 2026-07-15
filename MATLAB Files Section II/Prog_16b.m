% Prog_16b.m: RK4 Method for an IVP.
f=@(t,y) y*(1-y);
h=0.1;y0=0.1;xmax=1;
x=0:h:xmax;steps=1/h;
y=zeros(1,steps+1);
y(1)=y0;
for n=1:steps
    k1=h*f(t(n),y(n));
    k2=h*f(t(n)+h/2,y(n)+k1/2);
    k3=h*f(t(n)+h/2,y(n)+k2/2);
    k4=h*f(t(n)+h,y(n)+k3);
    k=(k1+2*k2+2*k3+k4)/6;
    y(n+1)=y(n)+k;
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
% End Prog_16b.m.