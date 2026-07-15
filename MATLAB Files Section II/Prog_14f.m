% Prog_14f.m: Multifractal f(alpha) Spectrum.
% Probabilities.
p1=0.10;p2=0.15;p3=0.20;p4=0.55;
% q values.
q=linspace(-15,10,2000);
% Partition function tau(q).
tau=log(p1.^q+p2.^q+p3.^q+p4.^q)/log(2);
% alpha(q)=-dtau/dq.
dtau=gradient(tau,q);
alpha=-dtau;
% f(alpha).
f=alpha.*q+tau;
figure;
plot(alpha,f,'b','LineWidth',2);
hold on;
% f(alpha)=alpha.
x=linspace(0,2,100);
plot(x,x,'r--','LineWidth',1.5);
grid on;
box on;
xlabel('\alpha');
ylabel('f(\alpha)');
title('Multifractal f(\alpha) Spectrum');
set(gca,'FontSize',15);
% End Prog_14f.m.
