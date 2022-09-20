function cent = cost_function(ch,xy)

% no of clusters
chn = length(ch)/2;

% no of nodes
n = size(xy,1);

xs = repmat(xy(:,1),1,chn);
ys = repmat(xy(:,2),1,chn);

chx = repmat(ch(1:2:end-1),n,1);
chy = repmat(ch(2:2:end),n,1);

d = sqrt((xs-chx).^2+(ys-chy).^2);

% min dist
mind =  min(d,[],2);

cent = sum(mind);

% 
% % cluster and calculate centrality
% for ii = 1:2:length(ch)-1
%     
%     d = sqrt((ch(ii)-xy(:,1)).^2+(ch(ii+1)-xy(:,2)).^2);
%     
%     
% end
