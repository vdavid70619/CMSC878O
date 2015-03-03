[D, c] = create_classification_problem(200,20,1);
x0 = rand(20,1);
[x_sol, res] = grad_descent(@(x)logreg_objective(x,D,c), ...
                            @(x)logreg_grad(x,D,c), x0);
subplot(1,3,1);
semilogy(res);
[x_sol, res] = grad_descent_BB(@(x)logreg_objective(x,D,c), ...
                            @(x)logreg_grad(x,D,c), x0);
subplot(1,3,2);
semilogy(res);
[x_sol, res] = grad_descent_nesterov(@(x)logreg_objective(x,D,c), ...
                            @(x)logreg_grad(x,D,c), x0);
subplot(1,3,3);
semilogy(res);