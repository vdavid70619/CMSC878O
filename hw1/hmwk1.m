%%%
%%% Xiyang Dai
%%% hw1
%%%
format long

disp(sprintf('---------------------- Part I ----------------------\n'))
disp(sprintf('Please see the figure\n'))
[D, c] = create_classification_problem(200,2,0);
subplot(1,2,1)
plot(D(:,1), D(:,2), '.');
[D, c] = create_classification_problem(200,2,1);
subplot(1,2,2)
plot(D(:,1), D(:,2), '.')

disp(sprintf('---------------------- Part II ----------------------\n'))
N = 5;
x = rand(N,1);
D = rand(N,N);
c = rand(N,1);
delta_x = 0.0001
num_grad = zeros(N,1);

for i=1:N
    x1 = x;
    x1(i) = x1(i) - delta_x;
    x2 = x;
    x2(i) = x2(i) + delta_x;
    num_grad(i) = (logreg_objective(x2,D,c) - logreg_objective(x1,D,c))./(2*delta_x);
end
num_grad
analy_grad = logreg_grad(x,D,c)
difference = (num_grad - analy_grad)

disp(sprintf('---------------------- Part III ----------------------\n'))
N=10;
x = rand(N,N,2);
y = rand(N,N);
inner1 = sum(sum(sum(x.*grad2d(y))))
inner2 = sum(sum(div2d(x).*y))
difference = inner1 - inner2