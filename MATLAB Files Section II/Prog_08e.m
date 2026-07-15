% Prog_08e.m: Conway's Game of Life with Pattern Detection.
N=100;                % 100x100 grid.
grid=rand(N)>0.9;     % Generate random initial population.
figure
totalTime=25;        % Total animation time in seconds.
steps=200;            % Number of generations.
pauseTime=totalTime/steps;
for step = 1:steps
    imagesc(grid)
    colormap(gray)
    axis square off
    liveCells = sum(grid(:));
    title(['Generation ',num2str(step),...
        '   Live Cells = ',num2str(liveCells)],'FontSize',18)
    drawnow
    pause(pauseTime)   % Controls animation duration.
    neighbors=conv2(double(grid),ones(3),'same') - grid;
    birth=(neighbors==3) & ~grid;
    survive=((neighbors==2) | (neighbors==3)) & grid;
    grid=birth | survive;
end
% End of Prog_08e.m.