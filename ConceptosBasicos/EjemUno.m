close all
clear all
clc

%%Ejemplo para red de distribución electrica colombiana

F=60;%Frecuencia de la red electrica 60Hz
T=1/F;
Rl=10;%Resistencia de carga
omega=(2*pi)/T;%Frecuencia angular
t=0:T/100:T;

V_t=170.*sin(omega*t);%Voltaje instantaneo
I_t=V_t./Rl;%Corriente instantanea

ConceptosBasicos(V_t,I_t,T);