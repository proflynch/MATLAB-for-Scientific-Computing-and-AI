% Prog_10b.m. Box and Whisker Plot.
% Clean region labels.
T_clean.Region=categorical(strtrim(string(T_clean.Region)));
% Remove Europe/Asia (and variants if needed)
T_plot = T_clean(~ismember(T_clean.Region, ...
    ["Asia/Europe"]),:);
figure
% Create boxplot.
boxplot(T_plot.("Life expectancy at birth 2010"), ...
    T_plot.Region, ...
    'Orientation','horizontal')
% Make median lines more visible.
med=findobj(gca,'Tag','Median');
set(med,'LineWidth',2.5,'Color','k')  
% Make outliers bigger and more visible.
h = findobj(gca,'Tag','Outliers');
set(h, ...
    'Marker','o', ...
    'MarkerSize',9, ...
    'LineWidth',1.5, ...
    'MarkerEdgeColor',[0.85 0 0])
title('Life Expectancy at Birth (2010) by Region')
xlabel('Life Expectancy (2010)')
ylabel('Region')
% Get box objects.
boxes=findobj(gca,'Tag','Box');
% Define colors.
% colors=lines(length(boxes));
colors = [
    0.85 0.33 0.10   % orange-red.
    0.00 0.45 0.74   % blue.
    0.47 0.67 0.19   % green.
    0.49 0.18 0.56   % purple.
    0.93 0.69 0.13   % yellow.
    0.30 0.75 0.93   % light blue.
    0.64 0.08 0.18   % dark red.
    0.25 0.25 0.25   % dark grey.
    0.90 0.40 0.70   % pink.
    ];
% Fill boxes.
for i = 1:length(boxes)
    patch(get(boxes(i),'XData'), ...
        get(boxes(i),'YData'), ...
        colors(i,:), ...
        'FaceAlpha',0.5, ...
        'EdgeColor','k');
end
set(gca,'FontSize',30)
% End Prog_10b.m.