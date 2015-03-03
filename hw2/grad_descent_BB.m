function [x_sol, res] = grad_descent_BB(f, grad, x0)
    eps = 1e-2;
    alpha = 0.1;    
    delta = ones(size(x0))*0.01;
    L = norm(grad(x0+delta)-grad(x0))/norm(x0+delta-x0);
    tau = 2/L; 
    
    x_old = x0;
    res(1) = norm(grad(x0));
    
    iter = 1;
    while res(iter)>eps
        iter = iter + 1;        
        d = - grad(x_old);

        % Line search to get stepsize
        while f(x_old+tau*d) >= f(x_old) + alpha*(tau*d)'*grad(x_old)
            tau = tau/2;
        end
        
        x_new = x_old + tau*d;
        
        % Do BB step for next iter
        tau = dot(x_new-x_old,x_new-x_old)/dot(x_new-x_old,grad(x_new)-grad(x_old));
        
        res(iter) = norm(grad(x_new));      
        x_old = x_new;
    end
    x_sol = x_new;
end
