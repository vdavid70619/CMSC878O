function [D, c] = create_classification_problem(Nf,Nd,h)
    sig = 0.1;
    cdist = 10./(1+exp(h)).*sig;
   
    D1 = normrnd(cdist/2, sig, [Nf/2, Nd]);
    D2 = normrnd(-cdist/2, sig, [Nf/2, Nd]);

    D = [D1; D2];
    c = [ones(Nf/2,1); -ones(Nf/2,1)];
end