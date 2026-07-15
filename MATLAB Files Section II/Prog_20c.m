% Prog_20c.m: Animation of a Student-T Curve.
figure
x=-4:0.01:4;
% Normal distribution curve.
y1=normpdf(x,0,1);
plot(x,y1,'LineWidth',2)
hold on
% Initial Student-T curve (base line).
Student_T=plot(x,0*x,'LineWidth',2);
axis([-4 4 0 0.42])
xlabel('Standard Deviations')
ylabel('Probability Densities')
set(gca,'FontSize',20)
grid on
% Animation
for n=0.1:0.1:25
    % Student-t probability density
    y2=tpdf(x,n);
    % Update curve
    set(Student_T,'YData',y2)
    drawnow
    pause(0.05)
end
% End Prog_20c.m.