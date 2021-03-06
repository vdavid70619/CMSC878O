function y = logreg_objective(x,D,c)
    Nd = size(x,1);
    f = zeros(Nd,1);
    z = c.*(D*x);
    
    f(z>=0) = log(1+exp(-z(z>=0)));
    f(z<0) = -z(z<0)+log(1+exp(z(z<0)));
    
    y = sum(f);
end