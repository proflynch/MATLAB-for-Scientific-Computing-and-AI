% Prog_10d.m: Load data, outliers and K-Means Clustering.
% Load Boston housing data (housing.txt must be in directory).
data=load('housing.txt');
% LSTAT=column 13, lower-status population.
% MEDV=column 14, median house value (target).
LSTAT=data(:,13);
MEDV=data(:,14);
X=[LSTAT MEDV];
% Scatterplot of raw data.
subplot(1,3,1)
scatter(LSTAT,MEDV,25,'filled');
xlabel('LSTAT (% Lower Status Population)');
ylabel('MEDV (Median House Value)');
title('Original Data');
set(gca,'FontSize',20)
grid on;
% Correlation.
corrVal=corr(LSTAT,MEDV);
fprintf('Correlation (LSTAT vs MEDV) = %.4f\n',corrVal);
% Normalize data.
Xs=zscore(X);
n=size(Xs,1);
p=size(Xs,2);
% Outlier detection (Mahalanobis)
D2=mahal(Xs,Xs);
threshold=chi2inv(0.975,p);
outIdx=D2>threshold;
fprintf('Outliers detected: %d / %d\n',sum(outIdx),n);
% Remove outliers.
Xclean=X(~outIdx,:);
XsClean=zscore(Xclean);
fprintf('Remaining data: %d\n',size(Xclean,1));
% Silhouette Analysis - before cleaning.
maxK=8;
silBefore=zeros(maxK,1);
for k=2:maxK
    idx=kmeans(Xs,k,...
        'Replicates',20,...
        'Start','plus');
    s = silhouette(Xs,idx);
    silBefore(k)=mean(s);
end
% Silhouette Analysis - after cleaning.
silAfter=zeros(maxK,1);
for k=2:maxK
    idx=kmeans(XsClean,k,'Replicates',20,'Start','plus');
    s=silhouette(XsClean,idx);
    silAfter(k)=mean(s);
end
[~,Kopt] = max(silAfter);
fprintf('Optimal K (after cleaning): %d\n',Kopt);
% Final K-Means clustering.
[idx,C]=kmeans(XsClean,...
    Kopt,...
    'Replicates',50,...
    'Start','plus');
subplot(1,3,2)
plot(2:maxK,silBefore(2:maxK),'-o','LineWidth',2);
hold on;
plot(2:maxK,silAfter(2:maxK),'-s','LineWidth',2);
xlabel('Number of Clusters (K)');
ylabel('Average Silhouette Score');
title('Silhouette Scores');
legend('Before Cleaning','After Cleaning');
set(gca,'FontSize',20)
grid on;
subplot(1,3,3)
gscatter(Xclean(:,1),Xclean(:,2),idx);
xlabel('LSTAT');
ylabel('MEDV');
title('Outliers Removed');
set(gca,'FontSize',20)
grid on;
% End Prog_10d.m.