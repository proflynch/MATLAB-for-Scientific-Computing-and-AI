% Prog_19a.m: Clustering Athlete Data.
% [VO2max,Sprint30m,VerticalJump]
X=[
68 3.88 66
67 3.90 65
66 3.92 64
65 3.94 63
67 3.89 66
66 3.91 64
68 3.87 67
65 3.95 62
66 3.90 65
67 3.88 66

60 4.08 57
59 4.10 56
61 4.06 58
60 4.09 57
58 4.13 55
59 4.11 56
61 4.05 58
60 4.07 57
59 4.12 55
58 4.14 54

53 4.32 48
52 4.35 47
54 4.30 49
55 4.28 50
51 4.38 46
52 4.34 47
53 4.31 48
54 4.29 49
55 4.27 50
52 4.36 46
];
% Standardize variables.
Xstd=zscore(X);
% K-means clustering.
rng(1)                 % Reproducible results
k=3;
[idx,C]=kmeans(Xstd,k,'Replicates',20,'Display','final');
% Scatter plot.
figure
colors=lines(k);
hold on
for i=1:k
    ind=idx==i;
    scatter3(X(ind,1),X(ind,2),X(ind,3),...
        80,colors(i,:),'filled');
end
% Convert centroids back to original units.
C_original=C.*std(X)+mean(X);
% Plot cluster centroids.
scatter3(C_original(:,1), ...
         C_original(:,2), ...
         C_original(:,3), ...
         300,'k','p','filled')
xlabel('VO_2 max (mL kg^{-1} min^{-1})')
ylabel('30 m Sprint Time (s)')
zlabel('Vertical Jump Height (cm)')
title('3D K-Means Clustering of Athlete Fitness Profiles')
legend('Cluster 1','Cluster 2','Cluster 3','Centroids', ...
       'Location','best')
grid on
set(gca,'FontSize',15)
view(80,20)
rotate3d on
% Cluster membership.
Athlete=(1:size(X,1))';
Results=table(Athlete,...
                X(:,1),...
                X(:,2),...
                X(:,3),...
                idx,...
'VariableNames',{'Athlete',...
'VO2max',...
'Sprint30m',...
'JumpHeight',...
'Cluster'});
disp(Results)
% Number of athletes in each cluster.
disp('Athletes per cluster')
tabulate(idx)
% End Prog_19a.m.