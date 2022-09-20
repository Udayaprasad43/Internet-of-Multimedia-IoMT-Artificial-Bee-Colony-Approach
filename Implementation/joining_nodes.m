function joining_nodes(H1,H2,H3,H4,H5,H6,H7,H8,H9,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey,mark)

% creating a cluster formation in each grid, where the header node will be connected to other nodes in the grid

% title('Headers joined with their respective nodes')
hold on
for i=1:length(nodex)
    plot(nodex(i),nodey(i),'b*') % placing all the nodes in the area
    text(nodex(i)+0.05,nodey(i),num2str(i))
end

join_head(H1,g1) % join the header of grid/zone 1 to all the other nodes (aka subnodes) in that grid/zone
join_head(H2,g2) % join the header of grid/zone 2 to all the other nodes (aka subnodes) in that grid/zone
join_head(H3,g3) % join the header of grid/zone 3 to all the other nodes (aka subnodes) in that grid/zone
join_head(H4,g4) % join the header of grid/zone 4 to all the other nodes (aka subnodes) in that grid/zone
join_head(H5,g5) % join the header of grid/zone 5 to all the other nodes (aka subnodes) in that grid/zone
join_head(H6,g6) % join the header of grid/zone 6 to all the other nodes (aka subnodes) in that grid/zone
join_head(H7,g7) % join the header of grid/zone 7 to all the other nodes (aka subnodes) in that grid/zone
join_head(H8,g8) % join the header of grid/zone 8 to all the other nodes (aka subnodes) in that grid/zone
join_head(H9,g9) % join the header of grid/zone 9 to all the other nodes (aka subnodes) in that grid/zone

% plot([mark(1) mark(1)],[mark(1) mark(4)])
% plot([mark(2) mark(2)],[mark(1) mark(4)])
% plot([mark(3) mark(3)],[mark(1) mark(4)])
% plot([mark(4) mark(4)],[mark(1) mark(4)])
% plot([mark(1) mark(4)],[mark(1) mark(1)])
% plot([mark(1) mark(4)],[mark(2) mark(2)])
% plot([mark(1) mark(4)],[mark(3) mark(3)])
% plot([mark(1) mark(4)],[mark(4) mark(4)])