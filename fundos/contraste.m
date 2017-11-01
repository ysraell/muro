function Out = contraste(X)


    [N,M]= size(X);
    hc = sum(sum(X==0));
    h(1) = hc;
    for i = 1:255
        h(i+1) = sum(sum(X==i));
        hc(i+1) = hc(i)+h(i+1);
    end

    T= @(p) round(hc(p+1)*254/(M*N));

    Y=X;

    for n=1:N
        for m=1:M
            Y(n,m) = T(X(n,m));
        end
    end

    Out = Y;

end