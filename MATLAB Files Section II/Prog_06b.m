% Prog_06b.m: Plot a bifurcation diagram.
% Plot 30 points for each mu value.
clear
itermax=100;x=zeros(1,itermax);
finalits=10;finits=itermax-(finalits-1);
for mu=0:0.001:4
    x=0.4;xo=x;
    for n=2:itermax
        xn=mu*xo*(1-xo);
        x(n)=xn;
        xo=xn;
    end
    plot(mu*ones(finalits),x(finits:itermax),'r.','MarkerSize',3)
    hold on
end
set(gca,'FontSize',20);
set(gca,'XTick',0:1:4)
set(gca,'YTick',0:0.2:1)
xlabel('{\mu}')
ylabel('\itx')
hold off
% End of Prog_06b.m.