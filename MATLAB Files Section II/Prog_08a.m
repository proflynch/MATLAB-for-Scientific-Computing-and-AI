% Prog_08a.m: Bubble Sort Example in MATLAB.
A=[4 2 5 1];   % Input list.
n=length(A);
for i=1:n-1
    for j=1:n-i
        if A(j)>A(j+1)
            % Swap elements
            temp=A(j);
            A(j)=A(j+1);
            A(j+1)=temp;
        end
    end
end
disp('Sorted array:');
disp(A);
% End of Prog_08a.m.