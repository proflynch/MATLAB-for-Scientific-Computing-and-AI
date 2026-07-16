% Prog_10d.m: Simplex method for a maximization problem.
% Objective function: minimize -z=-x1+x2-3x3.
% (Equivalent to maximizing z=x1-x2+3x3).
f=[-1;1;-3];
% Inequality constraints (A*x <= b).
A=[1 1 0;
   0 -1 -1];
b = [20;
    -10];
% Equality constraint (Aeq*x = beq).
Aeq=[1 0 1];
beq=5;
% Variable bounds.
lb=[0;0;0];
ub=[];
% Solver options
options=optimoptions('linprog',...
    'Algorithm','dual-simplex',...
    'Display','iter');
% Solve the linear program.
[x,fval,exitflag,output]=linprog(...
    f,A,b,Aeq,beq,lb,ub,options);
% Recover the maximum objective value.
Pmax=-fval;
% Display results.
fprintf('Optimal solution:\n');
fprintf('x1 = %.4f\n', x(1));
fprintf('x2 = %.4f\n', x(2));
fprintf('x3 = %.4f\n', x(3));
fprintf('Maximum value of z = %.4f\n',Pmax);
% End Prog_10d.m.