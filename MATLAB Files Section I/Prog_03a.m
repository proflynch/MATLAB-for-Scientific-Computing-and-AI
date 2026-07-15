% Prog_03a.m: Venn Diagram: Exercise Survey.
% A = Run, B = Swim, C = Cycle
clear; clc; close all;
% Given data.
A = 65; B = 48; C = 60;AB = 40; BC = 30; AC = 35;ABC = 25;
% Compute individual regions.
AB_only = AB - ABC;BC_only = BC - ABC;AC_only = AC - ABC;
A_only = A - (AB_only + AC_only + ABC);
B_only = B - (AB_only + BC_only + ABC);
C_only = C - (AC_only + BC_only + ABC);
% Display results.
fprintf('Region values:\n');
fprintf('A only: %d\n', A_only);
fprintf('B only: %d\n', B_only);
fprintf('C only: %d\n', C_only);
fprintf('AB only: %d\n', AB_only);
fprintf('AC only: %d\n', AC_only);
fprintf('BC only: %d\n', BC_only);
fprintf('ABC: %d\n', ABC);
% Plot Venn diagram.
figure('Color','w');
hold on; axis equal off;
theta = linspace(0, 2*pi, 300);
% Circle positions.
r = 1.2;
xA=-0.8;yA=0.5;xB=0.8;yB=0.5;xC=0;yC=-0.8;
% Draw circles.
fill(xA+r*cos(theta),yA+r*sin(theta),'r','FaceAlpha',0.3,...
'EdgeColor','r','LineWidth',2);
fill(xB+r*cos(theta),yB+r*sin(theta),'b','FaceAlpha',0.3,...
'EdgeColor','b','LineWidth',2);
fill(xC+r*cos(theta),yC+r*sin(theta),'g','FaceAlpha',0.3,...
'EdgeColor','g','LineWidth',2);
% Add labels for sets.
set(gca, 'FontSize',20);
set(0, 'DefaultAxesFontSize', 20);
set(0, 'DefaultTextFontSize', 20);
text(xA-2, yA, 'A (Run)', 'FontWeight','bold');
text(xB+1.4, yB, 'B (Swim)','FontWeight','bold');
text(xC-0.2, yC-1.5, 'C (Cycle)', 'FontWeight','bold');
% Add region values.
text(xA-0.9, yA, num2str(A_only));
text(xB+0.7, yB, num2str(B_only));
text(xC, yC-1.1, num2str(C_only));
text(0, 1.0, num2str(AB_only));
text(-0.5, -0.3, num2str(AC_only));
text(0.5, -0.3, num2str(BC_only));
text(0, 0.2, num2str(ABC));
title("Venn Diagram of Exercise Survey (n = 100)");
hold off;
% End Prog_03a.m.