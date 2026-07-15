% Program_20d.m: Male and Female Sample Heights.
% Sample data.
FD=[58.9 65.2 63.4 64.5 61.7 66.0 62.9 65.6 ...
    61.9 63.7 68.1 61.8 63.4 58.9 58.4 60.8 ...
    70.1 62.3 61.7 63.1 62.3 61.8 66.3 ...
    62.0 65.3 61.2 67.0 60.2 63.9 63.4 ...
    63.7 60.3 63.4 60.6 67.4 66.9 60.9 63.6 ...
    59.6 59.7 65.0];
MD=[73.8 68.8 74.1 71.7 69.9 67.3 68.8 68.3 ...
    67.3 68.8 68.3 67.0 63.5 71.2 71.6 64.8 ...
    69.3 69.2 67.6 72.4 64.3 61.5 74.8 67.8 ...
    69.6 60.7 71.3 70.4 67.0 71.5 72.7 69.1 ...
    69.0 71.6 70.4];
% Descriptive statistics.
fprintf('Female Heights\n');
fprintf('--------------\n');
fprintf('Sample size          = %d\n',length(FD));
fprintf('Mean                 = %.2f\n',mean(FD));
fprintf('Median               = %.2f\n',median(FD));
fprintf('Standard deviation   = %.2f\n\n',std(FD));

fprintf('Male Heights\n');
fprintf('------------\n');
fprintf('Sample size          = %d\n',length(MD));
fprintf('Mean                 = %.2f\n',mean(MD));
fprintf('Median               = %.2f\n',median(MD));
fprintf('Standard deviation   = %.2f\n\n',std(MD));
% Box-and-whisker plot.
X=[FD(:);MD(:)];
group=[repmat({'Female'},numel(FD),1);
    repmat({'Male'},numel(MD),1)];
figure
boxplot(X,group)
ylim([55 80])
ylabel('Height (inches)')
title('Box-and-Whisker Plot')
set(gca,'FontSize',16)
grid on
% Histograms.
figure
histogram(FD,'BinWidth',2,'FaceAlpha',0.6)
hold on
histogram(MD,'BinWidth',2,'FaceAlpha',0.6)
xlabel('Height (inches)')
ylabel('Frequency')
title('Histograms of Heights')
legend('Female','Male','Location','northwest')
set(gca,'FontSize',16)
grid on
% Normal probability plot (Male).
figure
probplot('normal',MD)
title('Normal Probability Plot - Male Heights')
set(gca,'FontSize',16)
% Normal probability plot (Female).
figure
probplot('normal',FD)
title('Normal Probability Plot - Female Heights')
set(gca,'FontSize',16)
% Two-sample Student's t-test.
[h,p,ci,stats]=ttest2(FD,MD);
fprintf('Two-Sample Student''s t-Test\n');
fprintf('----------------------------\n');
fprintf('t-statistic = %.4f\n',stats.tstat);
fprintf('Degrees of freedom = %.1f\n',stats.df);
fprintf('p-value = %.5e\n',p);
if h
    fprintf('Result: Reject the null hypothesis.\n');
    fprintf('The mean heights are significantly different.\n');
else
    fprintf('Result: Fail to reject the null hypothesis.\n');
    fprintf('No significant difference in the mean heights.\n');
end
fprintf('\n95%% Confidence Interval for the Difference of Means:\n');
disp(ci)
% End Prog_20d.m.