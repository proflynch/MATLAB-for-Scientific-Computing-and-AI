% Prog_23a.m: ANN for an AND Gate.
% Weights and bias.
w1=20;w2=20;b=-30;
% AND Gate Outputs.
fprintf('AND(0,0) = %.6f\n',AND(0,0,w1,w2,b));
fprintf('AND(1,0) = %.6f\n',AND(1,0,w1,w2,b));
fprintf('AND(0,1) = %.6f\n',AND(0,1,w1,w2,b));
fprintf('AND(1,1) = %.6f\n',AND(1,1,w1,w2,b));
function y=sigmoid(v)
    y=1./(1+exp(-v));
end
function y=AND(x1,x2,w1,w2,b)
    y=sigmoid(x1*w1+x2*w2+b);
end
% End Prog_23a.m.