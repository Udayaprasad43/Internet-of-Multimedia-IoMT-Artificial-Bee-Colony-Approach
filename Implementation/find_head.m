function H=find_head(g,h)

% objective function vector and vector of integer variables.
f = [8;1]; 
intcon = 2;
A = [-1,-2;
    -4,-1;
    2,1];
b = [14;-33;20];
% Call  to intlinprog. (MATLAB function for mixed integer linear programming)
x = intlinprog(f,intcon,A,b);

for i=1:size(g,1)
    coor1=[g(i,1) g(i,2)];
    coor2=h;
    distnc(i)=distanceformula(coor1,coor2);  % find the distance of all the node in a grid with the centre coordinate of that grid. 
end

[B,IX]=sort(distnc); % sorting the nodes with their distance from the centre of the grid
H=[g(IX(1),1) g(IX(1),2)]; % picking the node which is closest to the centre


end