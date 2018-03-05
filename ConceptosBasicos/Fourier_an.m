function a_n=Fourier_an(t,T,S,n)

    omega_n=(n*2*pi)/T;
    cos_n=cos(0:(omega_n*T)/100:(omega_n*T));
    a_n=(trapz(t,S.*cos_n))./T;

end