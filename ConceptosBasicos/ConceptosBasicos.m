close all
clear all
clc

%%Ejemplo para red de distribución electrica colombiana

F=60;%Frecuencia de la red electrica 60Hz
T=1/F;
Rl=100;%Resistencia de carga
omega=(2*pi)/T;%Frecuencia angular

V_t=170.*sin(0:omega*T/100:omega*T);%Voltaje instantaneo
I_t=V_t./100;%Corriente instantanea

%%Verificación de condiciones minimas
[a,b]=size(V_t);
[c,d]=size(I_t);
if(a==c&&b==d)
    t_v=(1:b).*T/b;
    t_i=(1:d).*T/d;
    %%Potencia instantanea
    P_t=potencia_instantanea(V_t,I_t);
    
    %%Grafica de las variables
    figure
    subplot(3,1,1)
    plot(t_v,V_t,'r')
    grid on
    title('Voltaje en el tiempo')
    ylabel('Voltaje [V]');
    subplot(3,1,2)
    plot(t_i,I_t,'b')
    grid on
    title('Corriente en el tiempo')
    ylabel('Corriente [A]');
    subplot(3,1,3)
    plot(t_v,P_t,'k')
    grid on
    title('Potencia en el tiempo')
    ylabel('Potencia [W]');
    
    %%Energia del circuito en el periodo
    w=energia_circuito(t_v,P_t);
    fprintf('\nLa energia del circuito en un periodo es: %f [jul]', w);

    %%Valores medios
    V_o=valor_medio_o(t_v,T,V_t);
    fprintf('\nEl voltaje promedio es: %f [V]', V_o);
    I_o=valor_medio_o(t_v,T,I_t);
    fprintf('\nLa corriente promedio es: %f [A]', I_o);
    P_o=valor_medio_o(t_v,T,P_t);
    fprintf('\nLa potencia promedio es: %f [W]', P_o);
    
    %%Valores eficaces
    V_rms=valor_eficaz_rms(t_v,T,V_t);
    fprintf('\nEl voltaje eficaz es: %f [V]', V_rms);
    I_rms=valor_eficaz_rms(t_v,T,I_t);
    fprintf('\nLa corriente eficaz es: %f [A]', I_rms);
    
    %%Potencia aparente
    S=potencia_aparente(V_rms,I_rms);
    fprintf('\nLa potencia aparente es: %f [W]', S);

    %%Factor de potencia
    F_p = factor_potencia(P_o,S);
    fprintf('\nEl factor de potencia es: %f ', F_p);
    
    %%Obtención de representación de Fourier
    fprintf('La serie de Fourier del voltaje es:\n');
    max_n=5
    for n=1:max_n
        V_an(n)=Fourier_an(t_v,T,V_t,n);
        fprintf('a_%d = %f\n',n,V_an(n));
    end
    for n=1:max_n
        V_bn(n)=Fourier_bn(t_v,T,V_t,n);
        fprintf('b_%d = %f\n',n,V_bn(n));
    end
    %%Grafica de los elementos de fourier
    figure
    stem([V_o V_an])
    hold on
    stem([0 V_bn])
    legend('An','Bn');
    title('Serie de Fourier');
   
    %%Representacion de la serie de fourier
    fprintf('La serie de fourier del voltaje es: \n'); 
    serie_Fourier(V_o,V_an,V_bn,max_n);
   
    %%Calculo de la serie de Fourier
    fprintf('\nLos coeficientes Cn de la serie de Fourier es :\n');
    for n=1:max_n
        V_cn(n)=Fourier_cn(V_an(n),V_bn(n));
        fprintf('c_%d = %f\n',n,V_cn(n));
    end
    
    %%Calculo del DAT
    dat=DAT(V_o,V_cn,max_n);
    fprintf('El dat de la señal de voltaje es: %f',dat);
else
    fprintf('El voltaje y la corriente no poseen la misma dimensión');
    fprintf('\nAlgunos calculos no son viables y por tanto se cancela el proceso');
    viable=0;
end