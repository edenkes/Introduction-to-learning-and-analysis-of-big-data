function C = kmeans(X, k, t)
maxVal = max(max(X));
minVal = min(min(X));
centers = randi([minVal maxVal],k,size(X,2));
C=zeros(length(X),1);

for j=1:t
    for i=1:length(X)
        extendedX = repmat(X(i,:),k,1);
        allNorms = vecnorm(extendedX-centers,2,2);
        [~,cluster] = min(allNorms);
        C(i) = cluster;
    end

    for i=1:k
       clusterIndexes = find(C==i);
       if(isempty(clusterIndexes) )
           continue
       end 
       clusterVectors = X(clusterIndexes,:);
       centers(i,:) = sum(clusterVectors,1)/length(clusterIndexes);
    end
end

end