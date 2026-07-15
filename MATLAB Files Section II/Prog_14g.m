% Prog_14g.m: Color Mandelbrot set.
Nmax=300;          
xmin=-2.5;xmax=1.0;ymin=-1.5;ymax=1.5;
resolution=0.002;  % Smaller = higher resolution.
[x,y]=meshgrid(xmin:resolution:xmax, ...
                 ymin:resolution:ymax);
c=x+1i*y;
% Mandelbrot iteration.
z=zeros(size(c));
iteration=zeros(size(c));
for n=1:Nmax 
    z=z.^2+c;
    escaped=(abs(z)>2) & (iteration==0);
    iteration(escaped)=n; 
end
% Points inside the Mandelbrot set.
iteration(iteration==0) = Nmax;
% Plot colored Mandelbrot set.
figure;
imagesc([xmin xmax],[ymin ymax],iteration);
axis xy equal tight;
xlabel('Re(c)')
ylabel('Im(c)')
title('Colored Mandelbrot Set')
set(gca,'FontSize',15)
colormap(turbo);
colorbar;
% End Prog_14g.m.

