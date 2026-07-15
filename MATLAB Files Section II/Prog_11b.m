% Prog_11b.m: USGS Earthquake Analysis.
EQ=readtable('earthquakes.csv');
mag=EQ.Magnitude;
depth=EQ.Depth;
lon=EQ.Longitude;
lat=EQ.Latitude;
% Figure 1: Global Epicenters.
figure('Position',[100 100 1100 450])
subplot(1,2,1)
scatter(lon,lat,10+mag.^3,depth,'filled')
xlabel('Longitude')
ylabel('Latitude')
title('Global Earthquakes')
cb=colorbar;
ylabel(cb,'Depth (km)')
set(gca,'FontSize',15)
% Figure 2: Gutenberg-Richter Law.
subplot(1,2,2)
edges=0:0.2:9;
N=histcounts(mag,edges);
cumN=flip(cumsum(flip(N)));
M=edges(1:end-1);
semilogy(M,cumN,'ko-','LineWidth',1.5)
xlabel('Magnitude')
ylabel('Cumulative Frequency')
title('Gutenberg-Richter Relationship')
grid on
set(gca,'FontSize',15)
% Estimate b-value.
idx = M>3;
P=polyfit(M(idx),log10(cumN(idx)),1);
b=-P(1);
fprintf('Estimated b-value = %.2f\n',b);
% End Prog_11b.m.