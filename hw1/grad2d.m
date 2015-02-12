function G = grad2d(X)
    k = zeros(size(X,1),size(X,2));
    k(1,1) = -1;
    k(1,end) = 1;
    D = fft2(k);
    gx = ifft2(D.*fft2(X));

    k = zeros(size(X,1),size(X,2));
    k(1,1) = -1;
    k(end,1) = 1;
    D = fft2(k);    
    gy = ifft2(D.*fft2(X));

    G = cat(3,gx,gy);
end