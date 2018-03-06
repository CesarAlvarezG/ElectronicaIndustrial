function serie_Fourier(S_o,S_an,S_bn,max_n)
    umbral=0.01;
    fprintf('\n %.2f',S_o);
    maxS=max([S_an S_bn]);
    for n=1:max_n
        j=abs(S_an(n));
        if(j>=maxS)
            fprintf('+ %f*',2.*S_an(n));
            fprintf('cos(%d*W_o*t)',n);
        end
    end
    for n=1:max_n
        i=abs(S_bn(n));
        if(abs(S_bn(n))>=maxS)
            fprintf('+ %f*',2.*S_bn(n));
            fprintf('sin(%d*W_o*t)',n);
        end
    end
    fprintf(')');
end