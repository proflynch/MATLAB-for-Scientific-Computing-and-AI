% Prog_20a.m: Simple Linear Regression.
% Read the data.
data=readtable('CO2_GDP_USA_Data.csv');
% Extract variables by column number.
x=data{:,5};      % GDP per capita
y=data{:,4};      % CO2 per capita
% Scatter plot.
figure
scatter(x,y,60,'b','+')
hold on
grid on
xlabel('GDP Per Capita (USD)','FontSize',20)
ylabel('CO_2 Emissions Per Capita (Metric Tons)','FontSize',20)
% Fit linear regression.
mdl=fitlm(x,y);
% Predicted values.
y_pred=predict(mdl,x);
% Plot regression line.
plot(x,y_pred,'r','LineWidth',2)
% Regression statistics.
fprintf('Gradient (Slope): %.6f\n', mdl.Coefficients.Estimate(2));
fprintf('Intercept: %.6f\n', mdl.Coefficients.Estimate(1));
% Mean Squared Error.
MSE = mean((y-y_pred).^2);
fprintf('MSE: %.2f\n', MSE);
% R-squared.
fprintf('R^2: %.4f\n', mdl.Rsquared.Ordinary);
% Display full regression summary
disp(mdl)
hold off
set(gca,'FontSize',20)
% End Prog_20a.m.