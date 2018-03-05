function b_n=Fourier_bn(t,T,S,n)

    omega_n=(n*2*pi)/T;
    sin_n=sin(0:(omega_n*T)/100:(omega_n*T));
    b_n=(trapz(t,S.*sin_n))./T;

end