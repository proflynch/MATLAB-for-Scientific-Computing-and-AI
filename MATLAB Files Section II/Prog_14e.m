% Prog_14e.m: Cantor Set Multifractal Spectrum.
% Probabilities.
p1=1/9;p2=8/9;
% q values.
q=linspace(-10,10,1000);
% tau(q).
tau=log(p1.^q+p2.^q)/log(3);
dtau=gradient(tau,q);
% alpha(q).
alpha=-dtau;
% f(alpha).
f=alpha.*q+tau;
figure;
plot(alpha,f,'b','LineWidth',2);
hold on;
% f(alpha)=alpha.
x=linspace(0,2,100);
plot(x,x,'r','LineWidth',2);
axis([0 2 0 1]);
grid on;
xlabel('\alpha');
ylabel('f(\alpha)');
title('Cantor Set Multifractal Spectrum');
set(gca,'FontSize',15);
% End Prog_14e.m.