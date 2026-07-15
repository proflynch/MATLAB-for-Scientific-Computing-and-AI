% Prog_01c.m: Matrices.
% IMPORTANT: These commands should be run in the Command Window. 
A=[1 2 3 4;5 6 7 8;9 10 11 12]; % Spaces or commas separate columns.
B=[1,2,3;4,5,6;7,8,9;10,11,12]; % Spaces or commas separate columns.
I3=eye(3); % The 3x3 identity matrix (see the next chapter).
zeros(2,3) % A 2x3 matrix of zeros.
ones(3,3) % A 3x3 matrix of ones.
rand(2,2) % A 2x2 random matrix with elements between zero and one.
A=[1 2 3 4;5 6 7 8;9 10 11 12] % Spaces or commas separate columns.
A(1,2) % The element in row 1 column 2.
A(2,:) % The entire second row.
A(:,3) % The entire third column.
A(1:2,2:3) % Rows 1 and 2 and columns 2 and 3.
A=[1,2;3,4];B=[4 5;6 7]; % Two 2x2 matrices.
A+B % Element-wise addition.
B-A % Element-wise subtraction.
3*A % Scalar multiplication.
A*B % Matrix multiplication, row by column.
A.*B % Element-wise multiplication.
A' % The transpose matrix. Swap rows and columns.
size(A) % Gives the size of the matrix.
length(A) % Gives the longest dimension.
% End Prog_01c.m.