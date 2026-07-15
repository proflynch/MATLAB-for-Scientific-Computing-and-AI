% Prog_01b.m: Vectors.
% IMPORTANT: These commands should be run in the Command Window. 
u=1:5 % Elements 1 to 5.
v=0:0.5:2 % start:step:end.
w=linspace(0,10,5) % Five values equally spaced from 0 to 10.
u=[10,20,30,40,50,60,70,80]; % An eight-dimensional vector.
u(2) % Gives the second element, which is 20.
u(4:6) % Elements at indices 4,5 and 6.
u(end) % Gives the last element in the vector which is 80.
u(end-2) % Gives the element two indices from the end, which is 60.
u=[1,2,3];v=[4,5,6]; % Two 3D vectors, no output.
u+v % Add corresponding elements.
v-u
2*u % Each element is multiplied by the scalar.
u.*v % Element-wise multiplication.
v./u % Element-wise division.
u.^v % Element-wise powers [1^4 2^5 3^6].
length(u) % The length of the vector.
sum(u) % The sum of the elements.
mean(u) % The mean of the elements.
max(u) % The maximum of the elements.
min(u) % The minimum of the elements.
norm(u) % The norm (physical length) of the vector.
% End Prog_01b.m.


