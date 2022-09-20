function joining_heads(H1,H2,H3,H4,H5,H6,H7,H8,H9,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey,mark)

% Comment
% joining all the cluster heads which each other to form a network on only header nodes
hold on
plot([H5(1) H1(1)],[H5(2) H1(2)],'g-','LineWidth',2)    
plot([H5(1) H2(1)],[H5(2) H2(2)],'g-','LineWidth',2)
plot([H5(1) H3(1)],[H5(2) H3(2)],'g-','LineWidth',2)
plot([H5(1) H4(1)],[H5(2) H4(2)],'g-','LineWidth',2)
plot([H5(1) H6(1)],[H5(2) H6(2)],'g-','LineWidth',2)
plot([H5(1) H7(1)],[H5(2) H7(2)],'g-','LineWidth',2)
plot([H5(1) H8(1)],[H5(2) H8(2)],'g-','LineWidth',2)
plot([H5(1) H9(1)],[H5(2) H9(2)],'g-','LineWidth',2)

plot([H1(1) H2(1)],[H1(2) H2(2)],'g-','LineWidth',2)
plot([H2(1) H3(1)],[H2(2) H3(2)],'g-','LineWidth',2)
plot([H3(1) H6(1)],[H3(2) H6(2)],'g-','LineWidth',2)
plot([H6(1) H9(1)],[H6(2) H9(2)],'g-','LineWidth',2)
plot([H9(1) H8(1)],[H9(2) H8(2)],'g-','LineWidth',2)
plot([H8(1) H7(1)],[H8(2) H7(2)],'g-','LineWidth',2)
plot([H7(1) H4(1)],[H7(2) H4(2)],'g-','LineWidth',2)
plot([H4(1) H1(1)],[H4(2) H1(2)],'g-','LineWidth',2)

plot([H2(1) H4(1)],[H2(2) H4(2)],'g-','LineWidth',2)
plot([H4(1) H8(1)],[H4(2) H8(2)],'g-','LineWidth',2)
plot([H8(1) H6(1)],[H8(2) H6(2)],'g-','LineWidth',2)
plot([H2(1) H6(1)],[H2(2) H6(2)],'g-','LineWidth',2)

joining_nodes(H1,H2,H3,H4,H5,H6,H7,H8,H9,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey,mark) % creating the clusters