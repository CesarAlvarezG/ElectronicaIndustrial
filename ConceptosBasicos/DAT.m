function dat=DAT(S_o,S_cn,max_n)

    num=S_o*S_o;
    for n=2:max_n
        num=num+S_cn(n)*S_cn(n)/2;
    end
    dem=S_cn(1)*S_cn(1)/2;
    dat=sqrt(num/dem);

end