% Prog_08c.m: Dijkstra's Algorithm.
% Network routing and path optimisation.
% Adjacency matrix, 0 means no direct connection.
G=[ 0 2 0 0 5 0 0;
    2 0 4 0 0 0 0;
    0 4 0 1 0 7 0;
    0 0 1 0 3 2 0;
    5 0 0 3 0 0 6;
    0 0 7 2 0 0 1;
    0 0 0 0 6 1 0 ];
nodes={'A','B','C','D','E','F','G'};
n=size(G,1);
source=1;    % Node A.
% Initialise arrays.
dist=inf(1,n);
dist(source)=0;
visited=false(1,n);
previous=zeros(1,n);
% Dijkstra algorithm.
for i=1:n
    % Find nearest unvisited node.
    minDist=inf;
    u=-1;
    for j=1:n
        if ~visited(j) && dist(j) < minDist
            minDist=dist(j);
            u=j;
        end
    end
    visited(u)=true;
    % Update neighbours.
    for v=1:n
        if G(u,v)>0 && ~visited(v)
            alt=dist(u)+G(u,v);
            if alt<dist(v)
                dist(v)=alt;
                previous(v)=u;
            end
        end
    end
end
%% Display results.
disp('Shortest distances from Node A:')
disp('--------------------------------')
for i = 1:n
    fprintf('%s : %g\n',nodes{i},dist(i));
end
% End Prog_08c.m.