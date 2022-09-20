function [Fitness,CN,cluster_index,CH] = liuqiao(cluster_center,data_new,FoodNumber)

Fitness=zeros(1,size(cluster_center,1));
cluster_index=zeros(1,size(data_new,1));%the cluster result for each point
J=zeros(1,size(cluster_center,1));%the sum of the distance between one cluster and included points
CN=zeros(1,size(cluster_center,1));%the number of the points belonged to one cluster

for row=1:size(cluster_center,1)
    for col=1:size(data_new,1)
        dis(row,col)=norm(cluster_center(row,:)-data_new(col,:));% to calculate the distance 
    end
end

for col=1:size(data_new,1)
    minvals = find(dis(:,col)==min(dis(:,col)));
    cluster_index(col)=minvals(1);%cluster by the minimal Euclidean distance
    CN(cluster_index(col))=CN( cluster_index(col))+1;
    J(cluster_index(col))=J(cluster_index(col))+dis(cluster_index(col),col);
end


for row=1:size(cluster_center,1)
    if CN(row)==0
        ObjVal(row)=0;
    else
        ObjVal(row)=J(row)/CN(row);
    end
end
for row=1:size(cluster_center,1)
    if ObjVal(row)==0
        Fitness(row)=0;
    else
        Fitness(row)=1/(1+ObjVal(row));
    end
end
centerpoint=mean(data_new);
trW=sum(J.^2);
trB=0;
for row=1:size(cluster_center,1)
    trB=trB+CN(row)*(norm(centerpoint-cluster_center(row,:)))^2;
end
CH=(trB/(FoodNumber-1))/(trW/(size(data_new,1)-FoodNumber));


end



        
    

        







