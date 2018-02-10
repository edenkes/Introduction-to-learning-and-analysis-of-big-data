function w = perceptron(m, d, Xtrain, Ytrain, maxupdates)
	w = zeros(1,d);
	for t = 0:maxupdates - 1,
		wPre = w;
		for i = 1:m,
			if(dot(Xtrain(i, :), w) * Ytrain(i) <= 0),
				w += Xtrain(i, :) * Ytrain(i);
				break;
			end;
		end;
		if wPre == w,
			break;
		end;
	end;
	w = w';
endfunction