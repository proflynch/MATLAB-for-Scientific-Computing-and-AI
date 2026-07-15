% Prog_07b.m: Production of Nitrogen Dioxide.
% Constants
k =0.00713;
% Initial conditions.
a0=4;b0=1;c0=0;
% Define the ODE and work with vectors.
% dc/dt=k*(a0-c)^2*(b0-c/2)
odefun = @(t,c) k*(a0-c).^2.*(b0-c/2);
tspan=0:1:400;
[t,c]=ode45(odefun,tspan,c0);
% Plot the solution.
figure;
plot(t,c,'LineWidth',2);
xlabel('Time (s)');
ylabel('c(t) (Mol L^{-1})');
title('Production of Nitrogen Dioxide');
grid on;
% Display c(100).
fprintf('c(100) = %f Moles per litre\n', c(100));
set(gca,'FontSize',20)
% End Prog_07b.m.