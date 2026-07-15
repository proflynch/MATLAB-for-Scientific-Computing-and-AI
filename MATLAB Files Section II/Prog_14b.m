% Prog_14b.m: The Sierpinski Triangle and the Chaos Game.
% The three vertices A,B,C.
vertices=[0,0;2,2*sqrt(3);4,0];
iterates=100000;
x=zeros(iterates,1);
y=zeros(iterates,1);
% Initial random point.
x(1)=rand;
y(1)=rand;
for i=2:iterates
    % Randomly choose one of the three vertices.
    k=randi(3);
    % Midpoint between current point and chosen vertex.
    x(i)=0.5*(vertices(k,1)+x(i-1));
    y(i)=0.5*(vertices(k,2)+y(i-1));
end
figure;
scatter(x,y,1,'r','.');   % Small red dots.
axis equal;
axis off;
% Save the figure
exportgraphics(gcf,'Sierpinski.png','Resolution',400);
% End Prog_14b.m.