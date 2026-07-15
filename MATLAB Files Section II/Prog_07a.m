% Prog_07a.m: Balancing chemical equations.
% Construct the augmented matrix.
ACCM=[ ...
    1 1 0 0 0 1;
    1 0 0 2 0 0;
    0 3 0 0 1 0;
    0 0 1 0 2 0;
    0 1 1 0 0 1;
    0 0 0 0 0 1];
disp('ACCM =');
disp(ACCM);
% Find the inverse matrix.
invACCM=inv(ACCM);
disp('Inverse of ACCM =');
disp(invACCM);
% Extract the 6th column (MATLAB indexing starts at 1).
col6=invACCM(:,6);
% Normalize by the minimum absolute nonzero value.
minval=min(abs(col6(col6 ~= 0)));
Nullv=col6 / minval;
disp('Null-space vector =');
disp(Nullv);
% End Prog_07a.m.