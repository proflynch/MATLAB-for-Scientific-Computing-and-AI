% Program_12a.m: Cobb-Douglas Model of Production.
syms L K lam
% Parameters
w=20;r=170;Lmax=2000;Kmax=200;
% Production function.
Y=200*L^(2/3)*K^(1/3);
C=10000;
Lag=Y-lam*(w*L+r*K-C);
eq1=diff(Lag,L)==0;
eq2=diff(Lag,K)==0;
eq3=w*L+r*K==C;
sol=solve([eq1,eq2,eq3],[L,K,lam],'Real',true);
Lopt1=double(sol.L(sol.L>0));
Kopt1=double(sol.K(sol.K>0));
Y1=double(200*Lopt1^(2/3)*Kopt1^(1/3));
C=20000;
Lag=Y-lam*(w*L+r*K-C);
eq1=diff(Lag,L)==0;
eq2=diff(Lag,K)==0;
eq3=w*L+r*K==C;
sol=solve([eq1,eq2,eq3],[L,K,lam],'Real',true);
Lopt2=double(sol.L(sol.L>0));
Kopt2=double(sol.K(sol.K>0));
Y2=double(200*Lopt2^(2/3)*Kopt2^(1/3));
Llist=linspace(0,Lmax,1000);
Klist=linspace(0,Kmax,120);
[Lg,Kg]=meshgrid(Llist,Klist);
figure
% Isoquants (red).
Z1=200.*Lg.^(2/3).*Kg.^(1/3);
[C1,h1]=contour(Lg,Kg,Z1,[Y1 Y2],'LineColor','r','LineWidth',3);
hold on
% Isocost lines (blue).
Z2=20.*Lg+170.*Kg;
[C2,h2]=contour(Lg,Kg,Z2,[10000 20000],'LineColor','b',...
    'LineWidth',1.5);
% Optimal points (points of tangency).
plot(Lopt1,Kopt1,'ko','MarkerFaceColor','k');
plot(Lopt2,Kopt2,'ko','MarkerFaceColor','k');
xlim([0 2000]);ylim([0 200]);
xlabel('L');
ylabel('K');
title('Cobb-Douglas Production Function');
legend([h1 h2],{'Isoquants','Isocost Lines'}, ...
    'Location','northwest');
set(gca,'FontSize',15);
grid on;
hold off;
% End Prog_12a.m.