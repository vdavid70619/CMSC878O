function d = div2d(G)  
    k = zeros(size(G,1),size(G,2));
    k(1,1) = -1;
    k(1,end) = 1;
    D = fft2(k);
    dx = ifft2(conj(D).*fft2(G(:,:,1)));

    k = zeros(size(G,1),size(G,2));
    k(1,1) = -1;
    k(end,1) = 1;
    D = fft2(k);    
    dy = ifft2(conj(D).*fft2(G(:,:,2)));

    d = dx + dy;
end