function C = singlelinkage(X, k)
sampleSize = length(X);
C=[1:length(X)]';
d=tril(dis(X));
d(d==0) = inf;
for t=1:sampleSize-k
    [~,neighbors] = min(d(:));
    i = mod((neighbors-1),sampleSize)+1;
    j = floor((neighbors-1)/sampleSize)+1;
    iVal = C(i);
    jVal = C(j);
    iIndexs = find(C==iVal)';
    jIndexs = find(C==jVal)';
    C([iIndexs jIndexs])=min([iVal,jVal]);
    d(iIndexs,jIndexs)=inf;
    d(jIndexs,iIndexs)=inf;
end
C = normalize(C);
end

function d = dis(X)
XY = X*X';
norms =diag(XY);
xNorms = repmat(norms,1,length(X));
yNorms = xNorms';
d = sqrt(xNorms+yNorms-2*XY);
end

function c = normalize(C)
k=length(unique(C));
c=inf(length(C),1);
for i=1:k
    m = min(C);
    indexes = C==m;
    c(indexes) = i;
    C(indexes) = inf;
end
end




