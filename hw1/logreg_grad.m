function g = logreg_grad(x,D,c)
    Nd = size(x,1);
    grad = zeros(Nd,1);
    z = c.*(D*x);
    
    grad(z>=0) = (-exp(-z(z>=0))./(1+exp(-z(z>=0))));
    grad(z<0) = -1+(exp(z(z<0))./(1+exp(z(z<0))));

    g = (diag(c)*D)'*grad;
end