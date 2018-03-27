close all
clear all
clc

%%Ejemplo para red de distribución electrica colombiana con armonico
%%rectificada

F=60;%Frecuencia de la red electrica 60Hz
T=1/F;
Rl=10;%Resistencia de carga
omega=(2*pi)/T;%Frecuencia angular
phi=pi/2;%Desface por elemento almacenador de energia
t=0:T/200:T;
V_fp=100;%Voltaje pico fundamental
V_ap=50;%Voltaje pico armonico
n_arm=2;%Numero del armonico


V_t=abs(V_fp.*sin(omega*t)+V_ap.*sin(n_arm*omega*t));%Voltaje instantaneo
I_t=V_t./Rl;%Corriente instantanea

ConceptosBasicos(V_t,I_t,T);