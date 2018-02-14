close all
clear all
clc
%%Ingreso de datos
V_t=input('Ingrese el Voltaje en el tiempo= ');
I_t=input('Ingrese la Corriente en el tiempo= ');
T=input('Ingrese el periodo de la se�al [seg]= ');

%%Verificaci�n de condiciones minimas
[a,b]=size(V_t);
[c,d]=size(I_t);
if(a==c&&b==d)
    viable=1;
else
    fprintf('El voltaje y la corriente no poseen la misma dimensi�n');
    fprintf('\nAlgunos calculos no son viables y por tanto se omitiran');
    viable=0;
end

%%Grafica de las se�ales
t_v=(1:b).*T/b;
t_i=(1:d).*T/d;
subplot(2,1,1)
plot(t_v,V_t)
grid on
title('Voltaje en el tiempo')
subplot(2,1,2)
plot(t_i,I_t)
grid on
title('Corriente en el tiempo')
%%Protencia instantanea
P_t=V_t.*I_t;

figure
subplot(3,1,1)
plot(t_v,V_t)
grid on
title('Voltaje en el tiempo')
subplot(3,1,2)
plot(t_i,I_t)
grid on
title('Corriente en el tiempo')
subplot(3,1,3)
plot(t_v,P_t)
grid on
title('Potencia en el tiempo')

%%Energia del circuito en el periodo
w=trapz(t_v,P_t);
fprintf('La energia del circuito en un periodo es: %f [jul]', w);
