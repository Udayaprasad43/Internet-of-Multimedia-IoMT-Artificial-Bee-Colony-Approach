function Cid = cluster_node(CHs,xy)

% no of clusters
chn = length(CHs);

% ch = [xy(CHs,1)' xy(CHs,2)'];
ch = [xy(CHs,1)'; xy(CHs,2)'];
ch = ch(:)';

% no of nodes
n = size(xy,1);

% Calcualte distance of each node with each CH
xs = repmat(xy(:,1),1,chn);
ys = repmat(xy(:,2),1,chn);

chx = repmat(ch(1:2:end-1),n,1);
chy = repmat(ch(2:2:end),n,1);

d = sqrt((xs-chx).^2+(ys-chy).^2);

% min dist
mind =  min(d,[],2);

% Initialise cluster id
Cid = zeros(1,n);

for ii = 1:chn
    % Find index 
    idx = find(d(:,ii)==mind);
    
    % Give cluster ID
    Cid(idx) = ii;
end

% 
% % cent = sum(mind);