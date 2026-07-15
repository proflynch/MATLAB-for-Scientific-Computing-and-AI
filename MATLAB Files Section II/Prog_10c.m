% Prog_10c.m: Plotting the feasibility region and maximizing profit.
% Grid for feasibility region.
m=linspace(0,150,500);
[X,Y]=meshgrid(m,m);
% Feasibility mask.
F = (20*X + 10*Y <= 2000) & ...
    (10*X + 20*Y <= 1200) & ...
    (10*X + 30*Y <= 1500);
% Constraint lines.
x=linspace(0,150,500);
y1=(2000-20*x)/10;
y2=(1200-10*x)/20;
y3=(1500-10*x)/30;
figure
hold on
% Shade feasible region.
contourf(X,Y,double(F),[1 1],'LineStyle','none', ...
    'FaceAlpha',0.3,'DisplayName','Feasibility Region');
colormap(gray)
% Plot constraints.
plot(x,y1,'LineWidth',4,...
    'DisplayName','20x+10y \leq 2000');
plot(x,y2,'LineWidth',4,...
    'DisplayName','10x+20y \leq 1200');
plot(x,y3,'LineWidth',4,...
    'DisplayName','10x+30y \leq 1500');
xlim([0 150])
ylim([0 100])
xlabel('x')
ylabel('y')
legend('Location','best')
grid on
box on
set(gca,'FontSize',20)
% End Prog_10c.m.