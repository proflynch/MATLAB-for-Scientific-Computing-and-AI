% Prog_02b.m: 3-D plot with contours, colors and lighting.
% You can rotate the figure once it plots.
figure;
[x,y]=meshgrid(linspace(-3,3,200));
z=sin(sqrt(x.^2+y.^2))./(sqrt(x.^2+y.^2)+eps); % Denominator never zero.
surf(x,y,z,'EdgeColor','none');
hold on;
contour3(x,y,z,15,'k','LineWidth',1);
colormap parula;
colorbar;
camlight headlight;
lighting gouraud;
view(45,30);
axis tight;
grid on;
title('Surface + Contours with Lighting');
set(gca,'FontSize',14); % Get current axis.
% End Prog_2b.m.