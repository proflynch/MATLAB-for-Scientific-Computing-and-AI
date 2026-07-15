% Prog_18b.m: Student Stress Analysis.
% Generate Dataset.
N=500;Student_ID=(1:N)';
Sleep_Hours=4+4*rand(N,1);
Exam_Pressure=randi([1 10],N,1);
Assignment_Load=randi([1 10],N,1);
Social_Support=randi([1 10],N,1);
Physical_Activity=randi([0 10],N,1);
Individual_Variation=15*randn(N,1);
Stress_Score=55+4*Exam_Pressure+3*Assignment_Load-2*Sleep_Hours-3*Social_Support-1*Physical_Activity+Individual_Variation;
Stress_Score(Stress_Score<0)=0;
Stress_Score(Stress_Score>100)=100;
StudentData=table(Student_ID, Sleep_Hours, Exam_Pressure, ...
    Assignment_Load,Social_Support,Physical_Activity,Stress_Score);
% Fit the primary linear model.
mdl=fitlm(StudentData,'Stress_Score ~ Sleep_Hours + Exam_Pressure + Assignment_Load + Social_Support + Physical_Activity');

% Generate Single Consolidated Figure with 3x2 Subplots.
figure('Name','Student Stress Multi-Variable Analysis','Color',[1 1 1],...
    'Position',[100, 100, 1000, 1200]);
% Subplot 1: Distribution.
subplot(3,2,1);
histogram(Stress_Score,20,'FaceColor',[0.2 0.6 0.8]);
xlabel('Stress Score'); ylabel('Number of Students');
title('A: Stress Score Distribution'); grid on;
% Subplot 2: Sleep Regression.
subplot(3,2,2);
scatter(Sleep_Hours,Stress_Score,25,[0.4 0.4 0.4],'filled'); 
hold on;
sleepModel=fitlm(StudentData,'Stress_Score ~ Sleep_Hours');
x_sleep=linspace(min(Sleep_Hours),max(Sleep_Hours),100)';
y_sleep=predict(sleepModel,table(x_sleep,'VariableNames',{'Sleep_Hours'}));
plot(x_sleep,y_sleep,'Color',[0.1 0.5 0.7],'LineWidth',3);
xlabel('Sleep Hours');ylabel('Stress Score');
title('B: Sleep Impact on Stress');grid on;

% Subplot 3: Exam Pressure Box and Whiskers.
subplot(3,2,3);
boxchart(categorical(Exam_Pressure),Stress_Score,'BoxFaceColor',[0.1 0.6 0.3]);
xlabel('Exam Pressure Rating (1-10)'); ylabel('Stress Score');
title('C: Stress Variation across Exam Pressure'); grid on;

% Subplot 4: Correlation Heatmap.
subplot(3,2,4);
Variables = [Sleep_Hours, Exam_Pressure, Assignment_Load, Social_Support,...
    Physical_Activity, Stress_Score];
Correlation = corrcoef(Variables);
Labels = {'Sleep', 'Exam', 'Assignment', 'Support', 'Activity', 'Stress'};
heatmap(Labels, Labels, Correlation, 'Colormap', jet, 'ColorbarVisible', 'on');
title('D: Variable Correlation Matrix');

% Subplot 5: Regression Accuracy.
subplot(3,2,5);
scatter(StudentData.Stress_Score,mdl.Fitted,25,[0.8 0.3 0.3],'filled'); 
hold on;
plot([0 100], [0 100], 'k--', 'LineWidth', 2);
xlabel('Observed Stress'); ylabel('Predicted Stress');
title('E: Multiple Regression Accuracy'); grid on;

% Subplot 6: Residuals vs. Fitted Values Scatterplot.
subplot(3,2,6);
Residuals = mdl.Residuals.Raw;
scatter(mdl.Fitted, Residuals, 25, [0.5 0.2 0.6], 'filled'); hold on;
yline(0, 'k--', 'LineWidth', 1.5); % Reference line at zero residual error
xlabel('Fitted (Predicted) Values'); ylabel('Residuals (Error)');
title('F: Residuals vs. Fitted Values'); 
grid on;
% End Prog_18b.m.
