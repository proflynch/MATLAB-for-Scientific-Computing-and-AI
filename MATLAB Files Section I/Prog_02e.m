% Prog_02e.m: The Fibonacci sequence.
Nmax=input('Input the number of terms of the Fibonacci sequence:')
% Preallocate array size using the zeros command.
F=zeros(1,Nmax);F(1)=0;F(2)=1;
for i=3:Nmax
F(i)=F(i-1)+F(i-2);
end
F
% End of Prog_02e.m.