function w = softsvm(lambda, m, d, Xtrain, Ytrain)
	H = diag([2*lambda*ones(1, d) , zeros(1, m)]);
	u = [zeros(1, d) , (1/m)*ones(1, m)];
	a1 = Xtrain .* Ytrain;
	A = [a1 , eye(m) ; zeros(m, d) , eye(m)];
	v = [ones(m , 1); zeros(m , 1)];
	
	w = quadprog(H,u,-A,-v);
	w = w(1:d);
endfunction
