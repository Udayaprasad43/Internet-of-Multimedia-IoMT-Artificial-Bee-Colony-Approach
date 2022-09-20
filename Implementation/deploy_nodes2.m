function [nodex,nodey,mark,g1,g2,g3,g4,g5,g6,g7,g8,g9]=deploy_nodes2(node)

high=10; % higher bound for a coordinate value
low=0; % lower bound for a coordinate value
mark=[0 3.3 6.6 10]; % points where grid is to be placed



g1=[]; % nodes in grid 1
g2=[]; % nodes in grid 2
g3=[]; % nodes in grid 3
g4=[]; % nodes in grid 4
g5=[]; % nodes in grid 5
g6=[]; % nodes in grid 6
g7=[]; % nodes in grid 7
g8=[]; % nodes in grid 8
g9=[]; % nodes in grid 9
for i=1:node % x and y coordinates for good sensor nodes
    nodex(i)=low+(high-low).*rand(1,1); % generate a random x coordinate
    nodey(i)=low+(high-low).*rand(1,1); % generate a random y coordinate
    if nodex(i)>mark(1) && nodex(i)<mark(2) && nodey(i)>mark(1) && nodey(i)<mark(2)
        g1=[g1; nodex(i) nodey(i)]; % place the randomly generated coordinate in grid 1
    end
    if nodex(i)>mark(2) && nodex(i)<mark(3) && nodey(i)>mark(1) && nodey(i)<mark(2)
        g2=[g2; nodex(i) nodey(i)]; % place the randomly generated coordinate in grid 2
    end
    if nodex(i)>mark(3) && nodex(i)<mark(4) && nodey(i)>mark(1) && nodey(i)<mark(2)
        g3=[g3; nodex(i) nodey(i)]; % place the randomly generated coordinate in grid 3
    end
    
    if nodex(i)>mark(1) && nodex(i)<mark(2) && nodey(i)>mark(2) && nodey(i)<mark(3)
        g4=[g4; nodex(i) nodey(i)]; % place the randomly generated coordinate in grid 4
    end
    if nodex(i)>mark(2) && nodex(i)<mark(3) && nodey(i)>mark(2) && nodey(i)<mark(3)
        g5=[g5; nodex(i) nodey(i)]; % place the randomly generated coordinate in grid 5
    end
    if nodex(i)>mark(3) && nodex(i)<mark(4) && nodey(i)>mark(2) && nodey(i)<mark(3)
        g6=[g6; nodex(i) nodey(i)]; % place the randomly generated coordinate in grid 6
    end
    
    if nodex(i)>mark(1) && nodex(i)<mark(2) && nodey(i)>mark(3) && nodey(i)<mark(4)
        g7=[g7; nodex(i) nodey(i)]; % place the randomly generated coordinate in grid 7
    end
    if nodex(i)>mark(2) && nodex(i)<mark(3) && nodey(i)>mark(3) && nodey(i)<mark(4)
        g8=[g8; nodex(i) nodey(i)]; % place the randomly generated coordinate in grid 8
    end
    if nodex(i)>mark(3) && nodex(i)<mark(4) && nodey(i)>mark(3) && nodey(i)<mark(4)
        g9=[g9; nodex(i) nodey(i)]; % place the randomly generated coordinate in grid 9
    end
end

% title('Placement of all nodes')
hold on
for i=1:node
    plot(nodex(i),nodey(i),'b*') % plot all the x and y coordinates
    text(nodex(i)+0.05,nodey(i),num2str(i)) 
end

% plot([mark(1) mark(1)],[mark(1) mark(4)])
% plot([mark(2) mark(2)],[mark(1) mark(4)])
% plot([mark(3) mark(3)],[mark(1) mark(4)])
% plot([mark(4) mark(4)],[mark(1) mark(4)])
% plot([mark(1) mark(4)],[mark(1) mark(1)])
% plot([mark(1) mark(4)],[mark(2) mark(2)])
% plot([mark(1) mark(4)],[mark(3) mark(3)])
% plot([mark(1) mark(4)],[mark(4) mark(4)])