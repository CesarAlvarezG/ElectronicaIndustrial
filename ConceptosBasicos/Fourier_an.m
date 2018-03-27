function a_n=Fourier_an(t,T,S,n)
    omega_n=(n*2*pi)/T;
    cos_n=cos(omega_n.*t);
    a_n=(trapz(t,S.*cos_n))./T;

end