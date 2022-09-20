function join_head(H,g)

for i=1:size(g,1)
    plot([H(1) g(i,1)],[H(2) g(i,2)],'m--') % joining the header node with all the other nodes
end

end