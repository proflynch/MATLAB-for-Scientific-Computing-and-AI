%Prog_18c.m: Psychological ODE Model.
tspan = [0 30];
% The student starts with low knowledge (20%), zero consolidation, and low anxiety (5%).
initial_conditions = [20;0;5]; 
% Solve using ode45.
options=odeset('MaxStep',0.1);
[t,Y]=ode45(@psych_learning_model,tspan,initial_conditions,options);
% Visualization.
figure('Name','Learning and Consolidation Dynamics','Color',[1 1 1]);
plot(t,Y(:,1),'LineWidth',3,'Color',[0.1 0.5 0.7]); hold on;
plot(t,Y(:,2),'LineWidth',3,'Color', [0.2 0.6 0.2]);
plot(t,Y(:,3),'LineWidth', 2,'Color',[0.8 0.2 0.2]);
% Highlight active learning days (Days 1, 2, 3 and Day 12).
y_limits=ylim;
patch([1 3 3 1],[0 0 100 100],[0.9 0.9 1],'EdgeColor','none','FaceAlpha',0.4);
patch([12 12.5 12.5 12],[0 0 100 100],[0.9 0.9 1],'EdgeColor','none','FaceAlpha',0.4);
text(2,95,'Study Block','HorizontalAlignment','center','Color',[0.2 0.2 0.6],'FontWeight','bold');
text(12.25,95,'Review','HorizontalAlignment','center','Color',[0.2 0.2 0.6],'FontWeight','bold');
xlabel('Days');
ylabel('Strength / Percentage (%)');
title('ODE System: Cognitive Impact of Cramming vs. Spaced Revision');
legend({'Active Memory (Short-Term)','Consolidated Memory (Long-Term)','Anxiety Level'},'Location','best');
grid on; ylim([0 100]);
set(gca,'FontSize',20)
% Define the Interacting ODE Function.
function dYdt=psych_learning_model(t,Y)
    M=Y(1); % Active Memory.
    C=Y(2); % Consolidated Memory.
    A=Y(3); % Anxiety.
    % Intensive studying on Days 1,2,3 (adds 40 points/day). 
    % Quick revision session on Day 12 (adds 35 points/day).
    if (t>=1 && t<=3)
        learning_input=40; 
    elseif (t>=12 && t<=12.5)
        learning_input=35;
    else
        learning_input=0;
    end
    dMdt=-0.25*M+0.40*C-0.05*A+learning_input;
    dCdt=0.15*M*(1-C/100)-0.02*C;
    dAdt=-0.15*A+0.30*max(0,65-M);
    % Output column vector.
    dYdt=[dMdt;dCdt;dAdt];
end
% End Prog_18c.m.