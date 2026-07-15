%Prog_08d.m: CPU Scheduling Simulator.
burst=[9 5 3 7 4];   % Burst time for each process.
arrival=[0 1 2 3 4]; % Arrival times of each process.
quantum=2; % Each process gets 2 units of CPU time before switching.
remaining=burst;   % Unfinished execution time for each process.
time=0;
waiting=zeros(size(burst)); % Initializes waiting times.
queue=1:length(burst);      % The ready queue.
fprintf('Round Robin Scheduling\n\n')
% Main scheduling loop.
while any(remaining>0)
    for i=queue
        if remaining(i)>0
            execute=min(quantum,remaining(i));
            fprintf('Time %2d -> %2d : Process P%d\n',...
                time,time+execute,i)
            time=time+execute;
            remaining(i)=remaining(i)-execute;
            waiting=waiting+(remaining>0);
        end
    end
end
turnaround=waiting+burst;
T=table((1:length(burst))',burst',waiting',turnaround',...
    'VariableNames',...
    {'Process','Burst','Waiting','Turnaround'});
disp(T)
% End Prog_08d.m.