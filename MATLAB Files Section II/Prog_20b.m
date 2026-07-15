% Prog_20b.m: Markov Chains.
T=[2/10  4/10  1/10  3/10;
   1/15  5/15  8/15  1/15;
   5/18  9/18  3/18  1/18;
   3/17  6/17  2/17  6/17];
n=20;
v=[0.25 0.25 0.25 0.25];
disp(v)
vHist=v;
for x=1:n
    v=round(v*T,2);
    vHist=[vHist; v];
    if isequal(vHist(x,:),vHist(x+1,:))
        fprintf('Steady state after %d iterations.\n',x);
        break
    end
end
disp(v)
% Plot results
figure
plot(vHist,'LineWidth',1.5)
xlabel('Number of iterations')
ylabel('Probabilities')
legend('$p_1$','$p_2$','$p_3$','$p_4$',...
    'Location','best',...
    'Interpreter','latex')
grid on
set(gca,'FontSize',20)
% End Prog_20b.m.