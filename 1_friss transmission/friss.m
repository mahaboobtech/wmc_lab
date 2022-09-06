PtdBm=52;
GtdBi=25;
GrdBi=15;
frequency=1+10^9;
d=41935000*(1:1:200);
L=1;
Pt=10^((PtdBm-30)/10);
Gt=10^(GtdBi/10);
Gr=10^(GrdBi/10);
Lamda=3*10^8/frequency;
Pr=Pt*(Gt*Gr*Lamda^2)./((4*pi.*d).^2*L);
PrdBm=10*log10(Pr)+30;
plot(log10(d),PrdBm);
title('free space path loss model')
xlabel('log10(d)');
ylabel('p-r(dBm)');