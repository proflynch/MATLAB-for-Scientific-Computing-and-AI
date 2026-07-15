% Prog_23b.m: ANN for an OR Gate.
% Weights and bias.
w1=20;w2=20;b=-10;
% OR Gate Outputs.
fprintf('OR(0,0) = %.6f\n',OR(0,0,w1,w2,b));
fprintf('OR(1,0) = %.6f\n',OR(1,0,w1,w2,b));
fprintf('OR(0,1) = %.6f\n',OR(0,1,w1,w2,b));
fprintf('OR(1,1) = %.6f\n',OR(1,1,w1,w2,b));
function y=sigmoid(v)
    y=1./(1+exp(-v));
end
function y=OR(x1,x2,w1,w2,b)
    y=sigmoid(x1*w1+x2*w2+b);
end% End Prog_23b.m.