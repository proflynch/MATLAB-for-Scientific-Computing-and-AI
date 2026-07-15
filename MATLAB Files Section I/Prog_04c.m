% Prog_04c.m: Projectile.
y0=10;g=9.8;dt=0.1;t=0;
vx0=20*sqrt(3);vy0=20;
% Preallocate (estimate size for speed).
N=100;
sx=zeros(1,N);sy=zeros(1,N);
i=1;
% Simulation loop.
while true
    sx(i)=vx0*t;
    sy(i)=vy0*t-0.5*g*t^2+y0;
    if sy(i) < 0
        break
    end
    t=t+dt;i=i+1;
end
% Trim unused space.
sx=sx(1:i-1);sy=sy(1:i-1);
figure
plot(sx,sy,'r.','MarkerSize',10)
grid on
xlabel('Range')
ylabel('Height')
% End Prog_04c.m.