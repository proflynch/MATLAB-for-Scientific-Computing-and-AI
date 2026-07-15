% Prog_14a.m: The Koch Snowflake.
k=6;
hold on;
axis equal;
% Plot the three sides.
Koch_Curve(k,pi/3,0,0);
Koch_Curve(k,-pi/3,0.5,0.866);
Koch_Curve(k,pi,1,0);
hold off;
axis off;
% Local function.
function Koch_Curve(k,angtri,xstart,ystart)
    n_lines=4^k;
    h=3^(-k);
    x=zeros(1,n_lines+1);
    y=zeros(1,n_lines+1);
    x(1)=xstart;
    y(1)=ystart;
    segment=zeros(1,k);
    angle=[0,pi/3,-pi/3,0];
    for i=0:n_lines-1
        m=i;
        ang=angtri;
        for j=1:k
            segment(j)=mod(m,4);
            m=floor(m/4);
            ang=ang+angle(segment(j)+1); 
        end
        x(i+2)=x(i+1)+h*cos(ang);
        y(i+2)=y(i+1)+h*sin(ang);
    end
    plot(x,y,'b');
end
% End Prog_14a.m.