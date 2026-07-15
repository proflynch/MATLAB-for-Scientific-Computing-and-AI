% Prog_07d.m: Common Ion Effect.
% log10(AgCl solubility) vs KCl concentration
Ksp=1.82e-10;
numpoints = 200;
% KCl concentration range.
K_values=logspace(-5,-1,numpoints);
% Store Ag+ concentrations.
Ag_conc = zeros(size(K_values));
syms Ag Cl
% Solve for each KCl concentration.
for i=1:numpoints
    K=K_values(i);
    % Equilibrium equations.
    eq1=Ag*Cl==Ksp;
    eq2=Cl==Ag+K;
    % Solve equations.
    sol=solve([eq1,eq2],[Ag,Cl]);
    % Numerical Ag solutions.
    Ag_vals=double(sol.Ag);
    % Keep positive real solution.
    Ag_vals=Ag_vals(Ag_vals>0);
    % Store Ag+ concentration.
    Ag_conc(i)=Ag_vals(1);
end
log_Ag = log10(Ag_conc);
figure;
plot(K_values,log_Ag,'r','LineWidth',2);
title('log_{10}(AgCl Solubility) vs KCl Concentration');
xlabel('KCl Concentration (Ml^{-1})');
ylabel('log_{10}(AgCl Solubility) (Ml^{-1})');
set(gca,'FontSize',20)
grid on;
% End Prog_07d.m.