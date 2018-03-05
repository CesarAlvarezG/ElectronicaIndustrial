function rms=valor_eficaz_rms(t,T,S)

rms=sqrt((trapz(t,S.*S))./T);

end