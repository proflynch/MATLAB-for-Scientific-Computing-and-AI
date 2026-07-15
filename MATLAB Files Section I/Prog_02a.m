% Prog_02a.m: Basics and Symbolic Math Toolbox.
% IMPORTANT: These commands should be run in the Command Window. 
% This is a comment. % Helps when writing programs.
u=[1,2,3]; % 3D vector.
v=[4,5,6]; % 3D vector.
dot(u,v) % Dot product (High School Math).
cross(u,v) % Cross product.
A=[1,2;3,4] % A is a 2 by 2 matrix.
det(A) % The determinant of a matrix.
inv(A) % The inverse of a matrix.
eye(3) % The 3x3 identity matrix.
B=[0,3,1;0.3,0,0;0,0.5,0] % B is a 3 by 3 matrix.
eig(B) % The eigenvalues of B.
% List the eigenvectors and eigenvalues of B.
[Vects,Vals]=eig(B)
C=[100;200;300] % A 3 by 1 matrix.
D=B*C % Matrix multiplication.
E=B^4 % Powers of a matrix.
% Complex numbers.The semicolons suppress the output.
z1=1+i;z2=1-i;z3=2+i;
z4=2*z1-z2*z3 % Simple arithmetic.
abs(z1) % The modulus.
real(z1) % The real part.
imag(z1) % The imaginary part.
exp(i*z1) % Returns a complex number.
% The Symbolic Math Toolbox.
sym(1/2)+sym(1/3) % Symbolic evaluation.
% Double precision floating point arithmetic.
1/2+1/3
% Variable precision arithmetic (vpa 50 significant figures).
vpa(pi,50)
syms x y z % Symbolic objects.
z=x^3-y^3
factor(z) % Factorization.
% Symbolic expansion of the last answer.
expand(ans)
simplify(z/(x-y)) % Symbolic simplification.
% Symbolic solution of algebraic equations.
[x,y]=solve(x^2-x,2*x*y-y^2)
syms x mu
f=mu*x*(1-x) % Define a function.
subs(f,x,1/2) % Substitute for x, gives f(1/2).
fof=subs(f,x,f) % A function of a function.
limit(x/sin(x),x,0) % Limits.
diff(f,x) % Differentiation.
syms x y
diff(3*x^5*y^10,x,x,y,y,y) % Partial differentiation.
int(sin(x)*cos(x),x,0,pi/2) % Definite integration.
int(1/x,x,0,inf) % Improper integration.
syms n s t w x
symsum(1/n^2,1,inf) % Symbolic summation.
g=exp(x)
taylor(g,'Order',10) % Taylor series expansion.
laplace(t^3) % Laplace transform.
ilaplace(6/s^4) % Inverse Laplace transform.
fourier(-2*pi*abs(x)) % Fourier transform.
ifourier(4*pi/w^2) % Inverse Fourier transform.
% End Prog_02a.m.