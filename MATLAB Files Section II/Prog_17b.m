% Program_14b.m: Bifurcation diagram of the Ikeda map.
% Initialize parameters.
B=0.15;phi=0;Pmax=10;En=0;   
half_N=99999;
N=2*half_N+1;
N1=1+half_N;
% Preallocate arrays for speed.
esqr_up=zeros(half_N, 2);
esqr_down=zeros(N - N1, 2);
% Ramp the power up.
% Python range(half_N) is 0 to half_N-1.
for idx=1:half_N
    n=idx-1; 
    % Ikeda map iteration formula.
    En=sqrt(n*Pmax/N1)+B*En*exp(1i*(abs(En)^2-phi));
    esqr1=abs(En)^2;
    esqr_up(idx,:)=[n,esqr1];
end
% Ramp the power down.
% Python range(N1, N) runs from N1 to N-1.
idx_down=1;
for n=N1:(N - 1)
    % Ikeda map iteration formula.
    En=sqrt(2*Pmax-n*Pmax/N1)+B*En*exp(1i*(abs(En)^2-phi));
    esqr1=abs(En)^2;
    esqr_down(idx_down,:)=[N-n,esqr1];
    idx_down=idx_down+1;
end
% Plot the results.
figure('Color', 'w');
hold on;
% Plot upward ramp in red and downward ramp in blue.
plot(esqr_up(:,1),esqr_up(:,2),'r.','MarkerSize',0.2);
plot(esqr_down(:,1),esqr_down(:,2),'b.','MarkerSize',0.2);
% Configure axes and map ticks to Input Power scale.
xtick_vals=linspace(0,Pmax,6);
set(gca,'XTick',(xtick_vals./Pmax)*N1);
set(gca,'XTickLabel',string(num2cell(xtick_vals)));
% Labels and formatting
xlabel('Input Power');
ylabel('Output Power');
set(gca, 'FontSize', 15);
grid on;
hold off;
% End Prog_17b.m.