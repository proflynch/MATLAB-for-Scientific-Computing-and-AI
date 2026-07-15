% Prog_19b.m: Monte-Carlo Simulation of Basketball Team Performance.
N=10000;          % Number of simulated quarters.
n2=12;            % Two-point attempts.
n3=8;             % Three-point attempts.
nFT=10;           % Free throws.
% Success probablities.
p2=0.52;
p3=0.36;
pFT=0.81;
points=zeros(N,1);
% Monte Carlo simulation.
for i=1:N
    made2=sum(rand(n2,1)<p2);
    made3=sum(rand(n3,1)<p3);
    madeFT=sum(rand(nFT,1)<pFT);
    points(i)=2*made2+3*made3+madeFT;
end
% Statistics.
meanScore=mean(points);
stdScore=std(points);
prob30=mean(points>=30);
fprintf('Average points = %.2f\n',meanScore)
fprintf('Standard deviation = %.2f\n',stdScore)
fprintf('P(Score ≥ 30) = %.3f\n',prob30)
figure
histogram(points,'Normalization','probability')
xlabel('Fourth-quarter points')
ylabel('Probability')
title('Monte Carlo Simulation of Basketball Scoring')
grid on
set(gca,'FontSize',15)
% End Prog_19b.m.