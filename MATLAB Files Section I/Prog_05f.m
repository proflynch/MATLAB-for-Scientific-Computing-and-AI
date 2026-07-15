% Prog_05f.m: Psychology: Stress/Panic Model.
function Prog_05f
    % Parameters
    a = 5;        % stress input
    b = 0.3;      % recovery rate
    k = 1.5;      % panic amplification
    Sc = 8;      % panic threshold
    tspan = [0 5];
    % Initial stress.
    S0=0;
    [t,S]=ode45(@(t,S) dSdt(t,S,a,b,k,Sc),tspan,S0);
    figure;hold on;
    plot(t,S,'b','LineWidth',2);
    yline(Sc,'r--','Threshold Sc','FontSize', 15);
    xlabel('Time');
    ylabel('Stress S(t)');
    title('Stress–Panic Threshold Model');
    legend('Stress level','Panic threshold','Location','northwest');
    grid on;
    axis([0 5 0 30])
    set(gca,'FontSize',15)
    hold off;
end
function dS = dSdt(~,S,a,b,k,Sc)
    if S<Sc
        dS=a-b*S;
    else
        dS=a-b*S+k*(S-Sc);
    end
end
% End Prog_05f.m.