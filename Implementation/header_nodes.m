function [H1,H2,H3,H4,H5,H6,H7,H8,H9]=header_nodes(mark,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey)

h1=[mark(1)+((mark(2)-mark(1))/2) mark(1)+((mark(2)-mark(1))/2)]; % coordinate( h1(1) , h1(2) ) which are at the centre of grid 1.   
h2=[mark(2)+((mark(3)-mark(2))/2) mark(1)+((mark(2)-mark(1))/2)]; % coordinate( h2(1) , h2(2) ) which are at the centre of grid 2.   
h3=[mark(3)+((mark(4)-mark(3))/2) mark(1)+((mark(2)-mark(1))/2)]; % coordinate( h3(1) , h3(2) ) which are at the centre of grid 3.   

h4=[mark(1)+((mark(2)-mark(1))/2) mark(2)+((mark(3)-mark(2))/2)]; % coordinate( h4(1) , h4(2) ) which are at the centre of grid 4.   
h5=[mark(2)+((mark(3)-mark(2))/2) mark(2)+((mark(3)-mark(2))/2)]; % coordinate( h5(1) , h5(2) ) which are at the centre of grid 5.   
h6=[mark(3)+((mark(4)-mark(3))/2) mark(2)+((mark(3)-mark(2))/2)]; % coordinate( h6(1) , h6(2) ) which are at the centre of grid 6.   

h7=mark(1)+[((mark(2)-mark(1))/2) mark(3)+((mark(4)-mark(3))/2)]; % coordinate( h7(1) , h7(2) ) which are at the centre of grid 7.   
h8=[mark(2)+((mark(3)-mark(2))/2) mark(3)+((mark(4)-mark(3))/2)]; % coordinate( h8(1) , h8(2) ) which are at the centre of grid 8.   
h9=[mark(3)+((mark(4)-mark(3))/2) mark(3)+((mark(4)-mark(3))/2)]; % coordinate( h9(1) , h9(2) ) which are at the centre of grid 9.   


H1=find_head(g1,h1); % cluster head in grid 1
H2=find_head(g2,h2); % cluster head in grid 2
H3=find_head(g3,h3); % cluster head in grid 3
H4=find_head(g4,h4); % cluster head in grid 4
H5=find_head(g5,h5); % cluster head in grid 5
H6=find_head(g6,h6); % cluster head in grid 6
H7=find_head(g7,h7); % cluster head in grid 7
H8=find_head(g8,h8); % cluster head in grid 8
H9=find_head(g9,h9); % cluster head in grid 9

% title('Placement of all nodes with headers')
hold on
for i=1:size(nodex,2) % placing all the sensors in the area
    plot(nodex(i),nodey(i),'b*')
    text(nodex(i)+0.05,nodey(i),num2str(i)) 
end
plot(H1(1),H1(2),'go','LineWidth',3) % marking zone/grid header 1 with a darker shade of green
plot(H2(1),H2(2),'go','LineWidth',3) % marking zone/grid header 2 with a darker shade of green
plot(H3(1),H3(2),'go','LineWidth',3) % marking zone/grid header 3 with a darker shade of green
plot(H4(1),H4(2),'go','LineWidth',3) % marking zone/grid header 4 with a darker shade of green
plot(H5(1),H5(2),'go','LineWidth',3) % marking zone/grid header 5 with a darker shade of green
plot(H6(1),H6(2),'go','LineWidth',3) % marking zone/grid header 6 with a darker shade of green
plot(H7(1),H7(2),'go','LineWidth',3) % marking zone/grid header 7 with a darker shade of green
plot(H8(1),H8(2),'go','LineWidth',3) % marking zone/grid header 8 with a darker shade of green
plot(H9(1),H9(2),'go','LineWidth',3) % marking zone/grid header 9 with a darker shade of green

% plot([mark(1) mark(1)],[mark(1) mark(4)])
% plot([mark(2) mark(2)],[mark(1) mark(4)])
% plot([mark(3) mark(3)],[mark(1) mark(4)])
% plot([mark(4) mark(4)],[mark(1) mark(4)])
% plot([mark(1) mark(4)],[mark(1) mark(1)])
% plot([mark(1) mark(4)],[mark(2) mark(2)])
% plot([mark(1) mark(4)],[mark(3) mark(3)])
% plot([mark(1) mark(4)],[mark(4) mark(4)])

% axis tight