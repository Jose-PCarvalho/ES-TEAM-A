close all;
clear;
clc;

B=4600;
R25=68e3;
Rser=47e3;
Vcc=5;
ain=200:700;

Vmeas=Vcc.*ain./1023;
Rmeas=Vmeas.*Rser./(Vcc-Vmeas);
denum=log(Rmeas./R25)./B+1/298.15;
Tk=1./denum;
Tc=Tk-273.15;
disp(Tc)
figure(1)
plot(Tc)
figure(2)
plot(Vmeas);
figure(3)
plot(Rmeas);
