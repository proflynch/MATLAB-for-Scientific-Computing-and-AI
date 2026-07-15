% Prog_12d.m: Black-Scholes Option Prices for Call/Put.
function Prog_12d()
r=0.01;S=30;K=40;T=240/365;sigma=0.3;
BS_Call=BlackScholes(r,S,K,T,sigma,'C');
BS_Put=BlackScholes(r,S,K,T,sigma,'P');
fprintf('r=%.4f S=%.2f K=%.2f T=%.4f sigma=%.2f\n', ...
    r,S,K,T,sigma);
fprintf('CALL price: %.2f\n',BS_Call(1));
fprintf('PUT  price: %.2f\n\n',BS_Put(1));
fprintf('Delta Call: %.4f\n',BS_Call(2));
fprintf('Delta Put : %.4f\n\n',BS_Put(2));
fprintf('Gamma     : %.4f\n',BS_Call(3));
fprintf('Vega      : %.4f\n\n',BS_Call(4));
fprintf('Theta Call: %.4f\n',BS_Call(5));
fprintf('Theta Put : %.4f\n\n',BS_Put(5));
fprintf('Rho Call  : %.4f\n',BS_Call(6));
fprintf('Rho Put   : %.4f\n',BS_Put(6));
end
% Black-Scholes Function.
function out=BlackScholes(r,S,K,T,sigma,type)
d1=(log(S/K)+(r+0.5*sigma^2)*T)/(sigma*sqrt(T));
d2=d1-sigma*sqrt(T);
Nd1=normcdf(d1);
Nd2=normcdf(d2);
Nmd1=normcdf(-d1);
Nmd2=normcdf(-d2);
pdf_d1=normpdf(d1);
if type=='C'
    price=S*Nd1-K*exp(-r*T)*Nd2;
    delta=Nd1;
    rho=K*T*exp(-r*T)*Nd2*0.01;
    theta=(-S*pdf_d1*sigma/(2*sqrt(T)) ...
        - r*K*exp(-r*T)*Nd2)/365;
elseif type=='P'
    price=K*exp(-r*T)*Nmd2-S*Nmd1;
    delta=-Nmd1;
    rho=-K*T*exp(-r*T)*Nmd2*0.01;
    theta=(-S*pdf_d1*sigma/(2*sqrt(T)) ...
        + r*K*exp(-r*T)*Nmd2)/365;
else
    error('Type must be C or P');
end
gamma=pdf_d1/(S*sigma*sqrt(T));
vega=S*pdf_d1*sqrt(T)*0.01;
out=[price, delta, gamma, vega, theta, rho];
end
% End Prog_12d.m.