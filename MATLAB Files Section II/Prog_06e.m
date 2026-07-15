% Prog_06e.m: Hysteresis in Single Fibre Muscle
Length=800;a=380*0.098;b=0.325;
F0=a/0.257;   % Initial force.
vm=F0*b/a;
alpha=F0/0.1;
LSE0=0.3;
k=a/25;
t=0:0.01:12;
% Construct muscle length pattern.
L1=1.001:0.001:1.100;
L2=1.099:-0.001:1.000;
L3=0.999:-0.001:0.900;
L4=0.901:0.001:1.000;
L5=1.001:0.001:1.100;
L6=1.099:-0.001:1.000;
L7=0.999:-0.001:0.900;
L8=0.901:0.001:1.000;
L=[L1 L2 L3 L4 L5 L6 L7 L8];
% Plot muscle length variation.
figure
subplot(2,1,1);
plot(L,'LineWidth',2)
xlabel('Time (s)')
ylabel('Fraction of Muscle Length (L)')
set(gca,'FontSize',15)
grid on
% Solve Hill's ODEs.
LSE=zeros(1,800);   % Length series element
LCE=zeros(1,800);   % Length contractile element
F=zeros(1,799);
for i = 1:799
    % Hill's ODEs.
    LSE(i)=0.3+F(i)/alpha;
    LCE(i)=L(i)-LSE(i);
    dt=t(i+1)-t(i);
    dL=L(i+1)-L(i);
    dF=alpha*((dL/dt)+b*((F0-F(i))/(a+F(i))))*dt;
    F(i+1)=F(i)+dF;
end
% Add random noise.
FF=(F0/100)*randn(1,800);
F=F+FF;
% Plot hysteresis loop.
subplot(2,1,2);
plot(L,F,'r-','LineWidth',2)
xlabel('Fraction of Muscle Length (mm)')
ylabel('Force (mN/mm^2)')
axis([0.9 1.1 0 250])
set(gca,'FontSize',15)
grid on
% End Prog_06e.m.