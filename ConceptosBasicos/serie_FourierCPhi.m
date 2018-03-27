function serie_FourierCPhi(S_o,S_an,S_bn,max_n)
    umbral=0.001;
    C_n=sqrt(S_an.*S_an+S_bn.*S_bn);
    Phi_n=atan((-1*S_bn)./(S_an+eps));
    fprintf('\n %.2f',S_o);
    maxS=max(C_n);
    for n=1:max_n
        j=abs(C_n(n));
        if(j>=umbral*maxS)
            fprintf('+ %f*',2.*C_n(n));
            fprintf('cos(%d*W_o*t+ %f)',n,Phi_n(n));
        end
    end
    
    fprintf('\n');
end