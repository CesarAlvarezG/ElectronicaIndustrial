function serie_Fourier(S_o,S_an,S_bn,max_n)
    umbral=0.01;
    fprintf('\n %.2f +',S_o);
    for n=1:max_n
        if(S_an(n)>(umbral*max(S_an)))
            fprintf('+ %f*',2*S_an(n));
            fprintf('cos(%d*W_o*t)',n);
        end
    end
    for n=1:max_n
        if(S_bn(n)>(umbral*max(S_bn)))
            fprintf('+ %f*',2*S_bn(n));
            fprintf('sin(%d*W_o*t)',n);
        end
    end
    fprintf(')');
end