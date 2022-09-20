function [nodex_g,nodey_g,nodex_e,nodey_e,nodex,nodey]=deploy_nodes

high=10;
low=0;
% promt='Enter the number of sensors to be deployed: ';
% promt=100;
good_node=100; % node count
perc=0;
enc=ceil((perc*good_node)/100); % error node count

good_node=good_node-enc;

for i=1:good_node % x and y coordinates for good sensor nodes
    nodex_g(i)=low+(high-low).*rand(1,1);
    nodey_g(i)=low+(high-low).*rand(1,1);
end


for i=1:enc % x and y coordinates for error sensor nodes
    nodex_e(i)=low+(high-low).*rand(1,1);
    nodey_e(i)=low+(high-low).*rand(1,1);
end

if perc==0
    nodex_e=[];
    nodey_e=[];
end

nodex=[nodex_g nodex_e]; % all x coordinates nodes
nodey=[nodey_g nodey_e]; % all y coordinates nodes
    
% figure
% hold on
% for i=1:good_node
%     plot(nodex_g(i),nodey_g(i),'b*')
%     text(nodex_g(i)+0.05,nodey_g(i),num2str(i))
% end
% for i=1:enc
%     plot(nodex_e(i),nodey_e(i),'r*')
%     text(nodex_e(i)+0.05,nodey_e(i),num2str(i+good_node))
% end
% hold off
% title('Placement of all nodes')

   