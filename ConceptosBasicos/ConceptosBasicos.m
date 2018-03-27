function ConceptosBasicos(V_t,I_t,T)

%%Script para el calculo de los elementos basicos de electrónica industrial

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
        fprintf('\nLa energia del circuito en un periodo es: %f [jul]\n', w);

        %%Valores medios
        V_o=valor_medio_o(t_v,T,V_t);
        fprintf('\nEl voltaje promedio es: %f [V]\n', V_o);
        I_o=valor_medio_o(t_v,T,I_t);
        fprintf('\nLa corriente promedio es: %f [A]\n', I_o);
        P_o=valor_medio_o(t_v,T,P_t);
        fprintf('\nLa potencia promedio es: %f [W]\n', P_o);

        %%Valores eficaces
        V_rms=valor_eficaz_rms(t_v,T,V_t);
        fprintf('\nEl voltaje eficaz es: %f [V]\n', V_rms);
        I_rms=valor_eficaz_rms(t_v,T,I_t);
        fprintf('\nLa corriente eficaz es: %f [A]\n', I_rms);

        %%Potencia aparente
        S=potencia_aparente(V_rms,I_rms);
        fprintf('\nLa potencia aparente es: %f [W]\n', S);

        %%Factor de potencia
        F_p = factor_potencia(P_o,S);
        fprintf('\nEl factor de potencia es: %f \n', F_p);

        %%Obtención de representación de Fourier
        fprintf('\nLa serie de Fourier del voltaje es:\n');
        max_n=10;
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
        Ap=[V_o V_an];
        Bp=[0 V_bn];
        [xp yp]=size(Ap)
        xpn=0:(yp-1);
        stem(xpn,Ap)
        hold on
        stem(xpn,Bp)
        legend('An','Bn');
        title('Serie de Fourier');

        %%Representacion de la serie de fourier
        fprintf('\nLa serie de fourier del voltaje es: \n'); 
        serie_Fourier(V_o,V_an,V_bn,max_n);
        
        %%Representacion de la serie de fourier
        fprintf('\nLa serie de fourier del voltaje es: \n'); 
        serie_FourierCPhi(V_o,V_an,V_bn,max_n);

        
        %%Calculo de la serie de Fourier
        fprintf('\nLos coeficientes Cn de la serie de Fourier son:\n');
        for n=1:max_n
            V_cn(n)=Fourier_cn(V_an(n),V_bn(n));
            fprintf('c_%d = %f\n',n,V_cn(n));
        end

        %%Calculo del DAT
        dat=DAT(V_o,V_cn,max_n);
        fprintf('\nEl dat de la señal de voltaje es: %f\n',dat);
    else
        fprintf('El voltaje y la corriente no poseen la misma dimensión');
        fprintf('\nAlgunos calculos no son viables y por tanto se cancela el proceso');
    end
end