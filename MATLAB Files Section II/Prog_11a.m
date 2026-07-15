% Prog_11a.m: NASA GISTEMP Global Temperature Analysis.
T=readtable('GLB.Ts+dSST.csv');
years=T.Year;
monthly=table2array(T(:,2:13));
% Convert missing values.
monthly(monthly==999.9)=NaN;
% Annual mean anomaly.
annualMean=mean(monthly,2,'omitnan');
% Trend estimate.
p=polyfit(years,annualMean,1);
trend=polyval(p,years);
% Figure 1: Time Series.
figure('Position',[100 100 1000 450])
subplot(1,2,1)
plot(years,annualMean,'k')
set(gca,'FontSize',15)
hold on
plot(years,trend,'r','LineWidth',2)
xlabel('Year')
ylabel('Temperature Anomaly (°C)')
title('Global Surface Temperature')
legend('Annual Mean','Linear Trend')
grid on
% Figure 2: Climate Spiral.
theta=linspace(0,2*pi,12);
subplot(1,2,2)
for y=1:length(years)
    r=monthly(y,:);
    polarplot([theta theta(1)], ...
        [r r(1)], ...
        'Color',[0 0 1])
    hold on
end
set(gca,'FontSize',15)
title('Climate Spiral')
% End Prog_11a.m.