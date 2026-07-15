% Prog_23c.m: Simple Backpropagation.
% Initial weights.
w11=0.2;w12=0.15;w21=0.25;w22=0.3;w13=0.15;w23=0.1;
% Biases.
b1=-1;b2=-1;b3=-1;
% Target output and learning rate.
yt=0;eta=0.1;
% Inputs.
x1=1;x2=1;
% Forward propagation.
h1=x1*w11+x2*w21+b1;
h2=x1*w12+x2*w22+b2;
o1=sigmoid(h1)*w13+sigmoid(h2)*w23+b3;
y=sigmoid(o1);
fprintf('y = %.6f\n',y);
% Backpropagation.
% Update w13.
dErrdw13=(yt-y)*sigmoid(o1)*(1-sigmoid(o1))*sigmoid(h1);
w13=w13-eta*dErrdw13;
fprintf('w13 = %.6f\n',w13);
% Update w23.
dErrdw23=(yt-y)*sigmoid(o1)*(1-sigmoid(o1))*sigmoid(h2);
w23=w23-eta*dErrdw23;
fprintf('w23 = %.6f\n',w23);
function y=sigmoid(v)
    y=1./(1+exp(-v));
end
% End Prog_23c.m.