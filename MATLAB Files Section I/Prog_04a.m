% Prog_04a.m: Random Data and Normal Distribution.
% Set seed for reproducibility.
rng(42);
% Generate 1000 normal data points (mean=170, std=10).
data=170+10*randn(1,1000);
% Plot histogram (normalized to probability density).
histogram(data,30,'Normalization','pdf','FaceAlpha',0.6,'FaceColor','b')
hold on
% Get axis limits (like plt.xlim()).
x_limits=xlim;
x=linspace(x_limits(1),x_limits(2),100);
% Theoretical normal distribution.
p=normpdf(x,170,10);
% Plot theoretical curve.
plot(x,p,'k','LineWidth',2)
% Titles and labels.
title('Comparison of Random Data to Normal Distribution')
xlabel('Value')
ylabel('Density')
% Legend
legend('Data Histogram','Normal Distribution (170, 10)')
hold off
% Mean
m=mean(data);
% Standard deviation
s=std(data);
% Display results
fprintf('Mean = %.4f\n',m);
fprintf('Standard Deviation = %.4f\n',s);
% Set font size.
set(findall(gcf,'-property','FontSize'),'FontSize',14)
% End Prog_04a.m.