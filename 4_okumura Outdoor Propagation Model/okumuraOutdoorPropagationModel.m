clc;
close all;
hte = 30:1:100;
hre = input('enter the receiver antenna height 3m< hre<10m: ');
d = input('enter distance from base station 1km<d<100km: ');
f = input('enter the frequency 150mhz <fc<1920mhz: ');
c = 3*10^8;
lambda = (c)/(f*10^6);
lf = 10*log((lambda^2)/((4*pi)^2)*d^2);
amv = 35;
garea = 9;
ghte = 20*log(hte/200);

if(hre>3)
    ghre=20*log(hre/3);
else 
    ghre = 10*log(hre/3);
end 

l50 = lf+ amv-ghte-ghre-garea;
display('propagation pathloss is :');
disp(l50);
plot(hte,l50,'linewidth',1.5);
title('okumura Moel Analysis');
xlabel('transmit antenna heigh(km)');
ylabel('propagatoin path over(db at 50km');
grid on;
