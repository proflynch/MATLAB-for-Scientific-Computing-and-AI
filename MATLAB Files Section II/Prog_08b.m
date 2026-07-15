% Prog_08b.m: Comparison of the bubble sort algorithm and the sort
% function.
sizes=[100 500 1000 2000 5000];
times_builtin=zeros(size(sizes));
times_bubble=zeros(size(sizes));
for k=1:length(sizes)
    n=sizes(k);
    A=randi(100000,1,n);
    % Built-in MATLAB sort.
    tic;
    sort(A);
    times_builtin(k)=toc;
    % Bubble sort only for manageable sizes.
    if n<=2000
        B=A;
        tic;
        for i=1:n-1
            for j=1:n-i
                if B(j)>B(j+1)
                    temp=B(j);
                    B(j)=B(j+1);
                    B(j+1)=temp;
                end
            end
        end
        times_bubble(k)=toc;
    else
        times_bubble(k)=NaN;
    end
end
loglog(sizes,times_builtin,'-o','LineWidth',2)
hold on
loglog(sizes,times_bubble,'-s','LineWidth',2)
xlabel('Array Size')
ylabel('Execution Time (s)')
legend('MATLAB sort','Bubble Sort')
grid on
title('Sorting Algorithm Complexity')
set(gca,'FontSize',20)
% End Prog_08b.m.