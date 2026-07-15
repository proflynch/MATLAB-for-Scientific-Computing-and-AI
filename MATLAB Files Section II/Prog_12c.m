% Prog_12c.m: Modern Portfolio Theory.
% NOTE: CSV contains log returns (not prices).
% Load portfolio return data, from 2005-12-10 to 2025-12-01. 
data = readtable('Portfolio_Data.csv');
% Extract AAPL, CAT, GOOG returns.
returnsData=data{:,2:end};
% Convert to double.
returnsData=double(returnsData);
% Remove rows containing NaN values.
returnsData=returnsData(all(isfinite(returnsData),2),:);
% Portfolio statistics.
% Mean daily returns.
meanReturn=mean(returnsData);
% Covariance matrix.
C=cov(returnsData);
% Random portfolio generation.
Nport=5000;
nAssets=size(returnsData,2);
returns=zeros(Nport,1);
stds=zeros(Nport,1);
SharpeArr=zeros(Nport,1);
weights=zeros(Nport,nAssets);
for i=1:Nport
    % Random weights.
    w=rand(nAssets,1);
    w=w/sum(w);
    weights(i,:)=w;
    % Portfolio return.
    returns(i)=dot(meanReturn,w);
    % Annualised portfolio risk.
    stds(i)=sqrt(w'*C*w)*sqrt(250);
    % Sharpe ratio.
    SharpeArr(i)=returns(i)/stds(i);
end
% Maximum Sharpe ratio.
[maxSharpe,argmaxSA]=max(SharpeArr);
maxReturn=returns(argmaxSA);
maxRisk=stds(argmaxSA);
fprintf('Maximum Sharpe Ratio = %.5f\n',maxSharpe);
fprintf('Location = %d\n',argmaxSA);
% Minimum risk portfolio.
[minRisk,minIndex]=min(stds);
minReturn=returns(minIndex);
% Efficient frontier calculation.
riskLevels=linspace(min(stds),max(stds),300);
frontierRisk=[];
frontierReturn=[];
for r=riskLevels
    ind=stds<=r;
    if any(ind)
        frontierRisk(end+1)=r;
        frontierReturn(end+1)=max(returns(ind));
    end
end
% Plot MPT graph.
figure;
scatter(stds,returns,15,SharpeArr,'filled');
hold on;
% Maximum Sharpe portfolio.
scatter(maxRisk,maxReturn,500,'r','p','filled');
% Minimum risk portfolio.
scatter(minRisk,minReturn,500,'r','filled');
% Efficient frontier.
plot(frontierRisk,frontierReturn,'k--','LineWidth',4);
xlabel('Portfolio Standard Deviation (RISK)')
ylabel('Expected RETURN')
title('Modern Portfolio Theory')
colormap(parula)
cb=colorbar;
cb.Label.String = 'Sharpe Ratio';
grid on;
box on;
set(gca,'FontSize',20);
% Centre plot.
xlim([0.24 0.32])
ylim([0.0005 0.001])
legend('Random Portfolios',...
       'Maximum Sharpe',...
       'Minimum Risk',...
       'Efficient Frontier',...
       'Location','best')
% Display optimal portfolio weights.
fprintf('\nOptimal portfolio weights:\n')
for i = 1:nAssets  
    fprintf('Asset %d : %.4f\n',i,weights(argmaxSA,i));

end
% End Prog_12c.m.


