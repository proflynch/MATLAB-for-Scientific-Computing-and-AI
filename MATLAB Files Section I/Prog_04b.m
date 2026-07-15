% Prog_04b.m: Moments.
figure
hold on
grid on
% Axis limits.
axis([-11 11 -10 10])
% Horizontal axis line.
plot([-10 10], [0 0], 'k', 'LineWidth', 2)
% Point at origin (diamond marker).
plot(0, 0, 'd', 'MarkerSize', 8, 'MarkerFaceColor', 'k')
% Arrows.
quiver(-5, 0, 0, -4, 0, 'b', 'LineWidth', 2, 'MaxHeadSize', 1)
quiver(2.5, 0, 0, -1, 0, 'r', 'LineWidth', 2, 'MaxHeadSize', 1)
% Text annotations.
text(-7, -5, 'F_1', 'FontSize', 20, 'Color', 'b')
text(1.2, -2, 'F_2', 'FontSize', 20, 'Color', 'r')
% Calculation.
x = (5*5 - 2*2.5)/3;
fprintf('x = %.4f m\n', x)
hold off
% End Prog_04b.m.