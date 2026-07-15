% Program_17d.m: Three Body Problem. Case (iii).
% Simulation parameters.
n=800000;dt=0.00001;xmax=2;
% Preallocate position and velocity arrays (n rows, 3 columns).
r1=zeros(n,3);r2=zeros(n,3);r3=zeros(n,3);
v1=zeros(n,3);v2=zeros(n,3);v3=zeros(n,3);
% Initial conditions.
r1(1,:)=[0,0,0];r2(1,:)=[1,0.1,0];r3(1,:)=[-1,0,0];
v1(1,:)=[0,0,0];v2(1,:)=[1,9,-1];v3(1,:)=[0,-10,0];
% Solve using Euler's numerical method.
for i=1:(n-1)
    [dr1,dr2,dr3,dv1,dv2,dv3]=Planets(r1(i,:),r2(i,:),r3(i,:),...
        v1(i,:),v2(i,:),v3(i,:));
    r1(i+1,:)=r1(i, :)+dr1*dt;
    r2(i+1,:)=r2(i,:)+dr2*dt;
    r3(i+1,:)=r3(i,:)+dr3*dt;
    v1(i+1,:)=v1(i,:)+dv1*dt;
    v2(i+1,:)=v2(i,:)+dv2*dt;
    v3(i+1,:)=v3(i,:)+dv3*dt;
end
% Create 3D Plot.
figure('Color','w');
ax=axes;
hold(ax,'on');
% Plot trajectories.
plot3(ax,r1(:,1),r1(:,2),r1(:,3),'--','Color',[1,0.6,0]); % Orange
plot3(ax,r2(:,1),r2(:,2),r2(:,3),'--','Color','r');
plot3(ax,r3(:,1),r3(:,2),r3(:,3),'--','Color','b');
% Plot final positions (spheres/points) using scatter3.
scatter3(ax,r1(n,1),r1(n,2),r1(n,3),200,'filled','MarkerEdgeColor',[1,0.6 0],...
    'MarkerFaceColor',[1,0.6,0]);
scatter3(ax,r2(n,1),r2(n,2),r2(n,3),50,'filled','MarkerEdgeColor','r',...
    'MarkerFaceColor','r');
scatter3(ax,r3(n,1),r3(n,2),r3(n,3),50,'filled','MarkerEdgeColor','b',...
    'MarkerFaceColor','b');
% Configure axes limits and labels.
xlim(ax,[-xmax, xmax]);
ylim(ax,[-xmax, xmax]);
xlabel(ax,'x');
ylabel(ax,'y');
zlabel(ax,'z');
% Set camera view angles (Azimuth, Elevation)
view(ax,20,-120);
set(ax,'FontSize',15);
grid(ax,'on');
hold(ax,'off');
% Physics differential equation function.
function [dr1,dr2,dr3,dv1,dv2,dv3]=Planets(r1,r2,r3,v1,v2,v3)
G=1;m1=100;m2=1;m3=1;
r12=norm(r1-r2);r13=norm(r1-r3);r23=norm(r2-r3);
dr1=v1;dr2=v2;dr3=v3;
dv1=-G*m2*(r1-r2)/r12^3-G*m3*(r1-r3)/r13^3;
dv2=-G*m3*(r2-r3)/r23^3-G*m1*(r2-r1)/r12^3;
dv3=-G*m1*(r3-r1)/r13^3-G*m2*(r3-r2)/r23^3;
end
% End Prog_17d.m.