% Prog_18a.m: Memory Consolidation and Forgetting Dynamics.
% Parameters
Participants=100;Days=20;
N=Participants*Days;
% Participant and time variables.
Participant_ID=repelem((1:Participants)',Days);
Day=repmat((1:Days)',Participants,1);
% Learning variables.
Study_Time=zeros(N,1);
Practice_Sessions=zeros(N,1);
for i=1:N
    % Intensive learning period at the beginning.
    if Day(i)<=3 
        Study_Time(i)=30+40*rand;
        Practice_Sessions(i)=randi([1 5]);  
    else
        % Occasional revision.
        Study_Time(i)=5*rand;
        Practice_Sessions(i)=randi([0 2]); 
    end
end
% Other psychological variables.
Sleep_Hours=5+3*rand(N,1);
Distraction=10*rand(N,1);
% Individual ability differences.
Individual_Ability = repelem(10*randn(Participants,1),Days);
% Memory retention model.

Memory_Score = 95*exp(-0.12*Day) ...  % Forgetting curve.
+0.25*Study_Time ...          % Learning input.
+4*Practice_Sessions ...      % Repetition benefit.
+2.5*Sleep_Hours ...          % Consolidation.
-1.5*Distraction ...          % Interference.
+Individual_Ability ...       % Participant differences.
+5*randn(N,1);                % Measurement noise.
% Limit range.
Memory_Score(Memory_Score>100)=100;
Memory_Score(Memory_Score<0)=0;
% Create table.
MemoryData=table(...
    Participant_ID,...
    Day,...
    Study_Time,...
    Practice_Sessions,...
    Sleep_Hours,...
    Distraction,...
    Memory_Score);
% Save CSV.
writetable(MemoryData,'Memory_Consolidation_Data.csv');
% disp(MemoryData(1:10,:))
% FIGURE 1: Average memory retention curve.
MeanMemory = groupsummary(MemoryData,...
    'Day',...
    'mean',...
    'Memory_Score');
figure(1)
plot(MeanMemory.Day,MeanMemory.mean_Memory_Score,'-o','LineWidth',3)
xlabel('Days After Learning')
ylabel('Average Memory Score (%)')
title('Average Memory Retention Curve')
set(gca,'FontSize',20)
grid on
% Psychological Predictors.
% Calculate the mean values of the metrics across the entire experiment
avg_study       = mean(MemoryData.Study_Time)*0.25;
avg_practice    = mean(MemoryData.Practice_Sessions)*4.0;
avg_sleep       = mean(MemoryData.Sleep_Hours)*2.5;
avg_distraction = mean(MemoryData.Distraction)*-1.5;
% Group the weights into a single array.
impact_weights = [avg_study, avg_practice, avg_sleep, avg_distraction];
categories = {'Study Time (+)', 'Practice (+)', 'Sleep (+)', 'Distraction (-)'};
figure(2)
% Color code: Positive variables are green/blue, negative distraction is red.
bar_colors=[0.2 0.6 0.2; 0.1 0.5 0.8; 0.4 0.3 0.7; 0.8 0.2 0.2];
b=bar(impact_weights, 'FaceColor', 'flat');
b.CData=bar_colors;
set(gca, 'XTickLabel', categories);
ylabel('Average Score Impact (Points)')
title('Net Impact of Psychological Variables on Memory')
set(gca,'FontSize',20)
grid on
% Add numerical value labels on top of/below the bars for clarity.
for k=1:length(impact_weights)
    text(k, impact_weights(k) + sign(impact_weights(k))*0.8, ...
         num2str(impact_weights(k), '%+1.1f'), ...
         'HorizontalAlignment', 'center', 'FontWeight', 'bold');
end
% End Prog_18a.m.