function alpha = softsvmrbf(lambda, sigma, m, d, Xtrain, Ytrain)
    %xiNorm is a matrix where all row is <xi,xi> for the i-th row
    xiNorm = repelem(sum(Xtrain.^2,2),1,m);
    %xjNorm is a matrix where all column is <xj,xj> for the i-th column
    xjNorm = xiNorm';
    %xixj(i,j) is the value of <xi,xj> 
    xixj = Xtrain * Xtrain';
    %norm(a-b)^2 = <a-b,a-b> = <a,a>+<b,b>-2<a,b> therefore:
    G=exp(-((xiNorm+xjNorm)-2*xixj)/(2*sigma));
    
	H=[G*2*lambda zeros(m);zeros(m) zeros(m)];
    A=[G.*Ytrain eye(m);zeros(m) eye(m)];
    u=[zeros(1,m) ones(1,m)/m];
    v=[ones(m,1);zeros(m,1)];
    alpha = quadprog(H,u,-A,-v);
    alpha = alpha([1:m]);
end