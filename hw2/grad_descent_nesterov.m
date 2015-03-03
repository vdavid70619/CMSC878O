function [x_sol, res] = grad_descent_nesterov(f, grad, x0)
    eps = 1e-2;
    alpha = 1;    
    delta = ones(size(x0))*0.01;
    L = norm(grad(x0+delta)-grad(x0))/norm(x0+delta-x0);
    tau = 2/L; 
    
    x_ = x0;
    y_ = x0;
    res(1) = norm(grad(x0));
    
    iter = 1;
    while res(iter)>eps
        iter = iter + 1;        
        
        x_old = x_;
        x_ = y_ - tau*grad(y_);
        alpha_old = alpha;
        alpha = (1 + sqrt(1+4*alpha^2))/2;
        y_ = x_ + (alpha_old - 1)/alpha*(x_-x_old);
        
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
