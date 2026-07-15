% Prog_06a.m: The logistic map. 
mu=3.1;          % For case (iv).
x=0.2;         % Initially tank is one-fifth full.
xs=zeros(1,51);
xs(1)=x;
for i=1:50
    x=mu*x*(1-x);
    xs(i+1)=x;
end
plot(0:50,xs,'LineWidth',2)
xlabel('n')
ylabel('x_n')
set(gca,'FontSize',25)
