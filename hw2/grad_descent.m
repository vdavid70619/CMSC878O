function [x_sol, res] = grad_descent(f, grad, x0)
    eps = 1e-2;
    alpha = 0.1;    
    delta = ones(size(x0))*0.01;
    L = norm(grad(x0+delta)-grad(x0))/norm(x0+delta-x0);
    tau = 2/L; 
    
    x_ = x0;
    res(1) = norm(grad(x0));
    
    iter = 1;
    while res(iter)>eps
        iter = iter + 1;        
        d = - grad(x_);      
        % Line search to get stepsize
        while f(x_+tau*d) >= f(x_) + alpha*(tau*d)'*grad(x_)
            tau = tau/2;
        end
        
        x_ = x_ + tau*d;
        res(iter) = norm(grad(x_));        
    end
    x_sol = x_;
end
