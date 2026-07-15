% Prog_03c.m: Hypothesis testing.
n=30;p=0.85;
% Values of r.
r_values = 0:n;
% Probability mass function.
dist=binopdf(r_values, n, p);
% Plot as bar chart.
figure;
bar(r_values, dist)
xlabel('r')
ylabel('P(X = r)')
title('Binomial Distribution (n=30, p=0.85)')
% Mean, variance, standard deviation.
mu = n * p;
sigma2 = n * p * (1 - p);
sigma = sqrt(sigma2);
fprintf('Mean = %.2f\n', mu)
fprintf('Variance = %.2f\n', sigma2)
fprintf('Standard Deviation = %.2f\n', sigma)
% Probability calculations.
PXGTE29 = 1 - binocdf(28, n, p); % P(X>=29) = 1 - P(X<=28).
fprintf('P(X >= 29) = %.5f\n', PXGTE29)
% End Prog_03c.m.