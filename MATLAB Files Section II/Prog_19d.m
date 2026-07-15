% Prog_19d.m: PCA of Athlete Fitness Profiles.
% Variables:
% 1. VO2max.
% 2. 30 m Sprint Time.
% 3. Vertical Jump Height.
% 4. Strength Score.
% 5. Agility Test Time.
% Simulated Athlete dataset.
Athletes=[
62 4.05 58 82 8.1
65 4.10 55 78 8.0
68 4.00 62 80 7.8

50 3.75 75 92 7.5
48 3.70 82 95 7.3
52 3.85 78 90 7.6

55 4.20 85 98 8.2
53 4.25 88 96 8.4
57 4.15 80 94 8.0

58 3.95 70 85 7.4
60 4.00 68 83 7.2
56 4.10 65 80 7.7
];
% Variable names.
labels={
    'VO2max'
    'Sprint 30m'
    'Vertical Jump'
    'Strength'
    'Agility'
};
% Standardise variables.
% PCA requires variables on comparable scales.
X=zscore(Athletes);
% Perform PCA.
[coeff,score,latent,~,explained]=pca(X);
% Display results.
disp('Principal Component Variance Explained (%)')
disp(explained)
disp('PCA Loadings')
disp(coeff)
figure
% Subplot 1: Variance explained.
subplot(2,2,1)
bar(explained,'FaceColor',[0.2 0.6 0.8])
xlabel('Principal Component')
ylabel('Variance (%)')
title('Variance Explained')
grid on
set(gca,'FontSize',20)
% Subplot 2: Athlete PCA map.
subplot(2,2,2)
scatter(score(:,1),score(:,2),100,'filled')
hold on
for i=1:length(score(:,1))
    text(score(i,1)+0.05,...
         score(i,2),...
         ['A',num2str(i)],...
         'FontSize',20)
end
xlabel('PC1')
ylabel('PC2')
title('Athlete Performance Map')
grid on
set(gca,'FontSize',20)
% Subplot 3: PCA loadings.
subplot(2,2,3)
bar(coeff(:,1:2))
xticklabels(labels)
ylabel('Loading')
xlabel('Fitness Variable')
legend('PC1','PC2','Location','best')
title('Variable Contributions')
grid on
set(gca,'FontSize',20)
% Subplot 4: 3D PCA space.
subplot(2,2,4)
scatter3(score(:,1),score(:,2),score(:,3),100,'filled')
hold on
for i=1:length(score(:,1))
    text(score(i,1)+0.05,...
         score(i,2),...
         score(i,3),...
         ['A',num2str(i)],...
         'FontSize',8)
end
xlabel('PC1');ylabel('PC2');zlabel('PC3');
title('3D Athlete PCA Space');
grid on
set(gca,'FontSize',20)
view(45,25)
% End Prog_19d.m.