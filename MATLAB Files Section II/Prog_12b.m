% Prog12b.m: Interactive Solow-Swam Model.
% App-style window (interactive dashboard).
function Prog_12b
Tmax=100;Ylim=10;
% UI Figure.
fig=uifigure('Name','Solow–Swan Growth Model','Position',[100 100 800 500]);
ax=uiaxes(fig,'Position',[300 80 480 380]);
xlabel(ax,'Time');
ylabel(ax,'k(t)');
ylim(ax,[0 Ylim]);
grid(ax,'on');
hold(ax,'on');
% Place sliders.
    function [slider,label,y]=makeSlider(name, y, limits, value)
        uilabel(fig,'Position',[20 y+15 120 20],'Text',name);
        slider=uislider(fig, ...
            'Position',[120 y+20 150 3], ...
            'Limits',limits, ...
            'Value',value);
        label=uilabel(fig, ...
            'Position',[280 y+10 60 20], ...
            'Text',sprintf('%.2f',value));
    end
% Sliders
[alphaS,alphaL,y]=makeSlider('alpha',420,[0 1],0.3);
[deltaS,deltaL,y]=makeSlider('delta',370,[0 1],0.1);
[gS,gL,y]=makeSlider('g',320,[0 0.1],0.02);
[nS,nL,y]=makeSlider('n',270,[0 0.1],0.02);
[sS,sL,y]=makeSlider('s',220,[0 0.5],0.2);

% Update function.
    function updatePlot(~,~)
        alpha=alphaS.Value;
        delta=deltaS.Value;
        g=gS.Value;
        n=nS.Value;
        s=sS.Value;
        alphaL.Text=sprintf('%.2f',alpha);
        deltaL.Text=sprintf('%.2f',delta);
        gL.Text=sprintf('%.3f',g);
        nL.Text=sprintf('%.3f',n);
        sL.Text=sprintf('%.2f',s);
        % Solve ODE
        k0=1;
        sol=ode45(@(t,k) solowODE(t,k,alpha,delta,g,n,s),[0 Tmax],k0);
        t=linspace(0,Tmax,300);
        k=deval(sol,t);
        cla(ax)
        plot(ax,t,k,'b','LineWidth',2)
        ylim(ax,[0 Ylim])
        drawnow
    end
% Attach listeners.
alphaS.ValueChangedFcn=@updatePlot;
deltaS.ValueChangedFcn=@updatePlot;
gS.ValueChangedFcn=@updatePlot;
nS.ValueChangedFcn=@updatePlot;
sS.ValueChangedFcn=@updatePlot;
updatePlot();
end
% Solow-Swan ODE.
function dkdt=solowODE(~,k,alpha,delta,g,n,s)
dkdt=s*k.^alpha-(n+delta+g)*k;
end
% End Prog12_b.m.