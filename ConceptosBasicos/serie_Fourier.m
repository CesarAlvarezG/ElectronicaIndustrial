function serie_Fourier(S_o,S_an,S_bn,max_n)

    fprintf('\n %.2f +2(',S_o);
    for n=1:max_n
        if(S_an(n)>(0.1*max(S_an)))
            fprintf('+ %.2f*',S_an(n));
            fprintf('cos(%d*W_o*t)',n);
        end
    end
    for n=1:max_n
        if(S_bn(n)>(0.1*max(S_bn)))
            fprintf('+ %.2f*',S_bn(n));
            fprintf('sin(%d*W_o*t)',n);
        end
    end
    fprintf(')');
end