% Prog_03b.m: Binomial distribution.
n=20;p=0.9;
r_values = 0:n;
% Probability mass function.
dist = binopdf(r_values, n, p);
% Plot as bar chart.
figure;
bar(r_values, dist)
xlabel('r')
ylabel('P(X = r)')
title('Binomial Distribution')
% Mean, variance, standard deviation.
mu = n * p;
sigma2 = n * p * (1 - p);
sigma = sqrt(sigma2);
fprintf('Mean = %.2f\n', mu)
fprintf('Variance = %.2f\n', sigma2)
fprintf('Standard Deviation = %.2f\n', sigma)
% Probability calculations.
PXis20 = binopdf(20, n, p);
fprintf('P(X=20) = %.5f\n', PXis20)
PXGT18 = 1 - binocdf(18, n, p); % P(X>18) = 1 - P(X<=18).
fprintf('P(X>18) = %.5f\n', PXGT18)
% End Prog_03b.m.