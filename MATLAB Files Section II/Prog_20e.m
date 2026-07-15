% Prog_20e.m: Monte Carlo Simulation - European Roulette
% A gambler repeatedly bets on the ball landing on a red pocket.
simulations=100;      % Number of simulations
bankroll0  =10000;    % Initial bankroll (Euros)
wager      =100;      % Bet per spin (Euros)
spins      =3700;     % Number of spins
finalBalances=zeros(simulations,1);
figure
hold on
for sim=1:simulations
    bankroll=bankroll0;
    balance=zeros(spins-1,1);
    NumSpins=(1:spins-1)';
    for n=1:spins-1
        % Spin the roulette wheel (1-37)
        pocket=randi(37);
        % Win if the pocket number is even (simple approximation)
        if mod(pocket,2)==0
            bankroll=bankroll+wager;
        else
            bankroll=bankroll-wager;
        end
        balance(n)=bankroll;
    end
    plot(NumSpins,balance)
    finalBalances(sim) = bankroll;
end
xlabel('Number of Spins of Roulette Wheel')
ylabel('Bankroll (Euros)')
title('Monte Carlo Simulation of European Roulette')
set(gca,'FontSize',20)
grid on
fprintf('The player starts the game with %.0f euros and ends with %.2f euros (average).\n',...
    bankroll0,mean(finalBalances));
% End Prog_20e.m.