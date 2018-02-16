close all
%clear all
clc
%%Ingreso de datos
V_t=input('Ingrese el Voltaje en el tiempo= ');
I_t=input('Ingrese la Corriente en el tiempo= ');
T=input('Ingrese el periodo de la señal [seg]= ');

%%Verificación de condiciones minimas
[a,b]=size(V_t);
[c,d]=size(I_t);
if(a==c&&b==d)
    viable=1;
else
    fprintf('El voltaje y la corriente no poseen la misma dimensión');
    fprintf('\nAlgunos calculos no son viables y por tanto se omitiran');
    viable=0;
end

%%Grafica de las señales
t_v=(1:b).*T/b;
t_i=(1:d).*T/d;
subplot(2,1,1)
plot(t_v,V_t,'r')
grid on
title('Voltaje en el tiempo')
ylabel('Voltaje [V]');
subplot(2,1,2)
plot(t_i,I_t,'b')
grid on
title('Corriente en el tiempo')
ylabel('Corriente [A]')
%%Protencia instantanea
P_t=V_t.*I_t;

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
w=trapz(t_v,P_t);
fprintf('\nLa energia del circuito en un periodo es: %f [jul]', w);

%%Valores medios
V_o=(trapz(t_v,V_t))./T;
fprintf('\nEl voltaje promedio es: %f [V]', V_o);
I_o=(trapz(t_v,I_t))./T;
fprintf('\nLa corriente promedio es: %f [A]', I_o);
P_o=(trapz(t_v,P_t))./T;
fprintf('\nLa potencia promedio es: %f [W]', P_o);

%%Valores eficaces
V_rms=sqrt((trapz(t_v,V_t.*V_t))./T);
fprintf('\nEl voltaje eficaz es: %f [V]', V_rms);
I_rms=sqrt((trapz(t_v,I_t.*I_t))./T);
fprintf('\nLa corriente eficaz es: %f [A]', I_rms);

%%Potencia aparente
S=V_rms*I_rms;
fprintf('\nLa potencia aparente es: %f [W]', S);

%%Factor de potencia
F_p=P_o/S;
fprintf('\nEl factor de potencia es: %f ', F_p);
