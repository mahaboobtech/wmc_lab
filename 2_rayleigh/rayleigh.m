N=1000000; 
variance=0.2;
x=randn(1,N);
y=randn(1,N);
r=sqrt(variance*(x.^2+y.^2));
step=0.1;range=0:step:3;
h=hist(r,range);
approxPDF=h/(step*sum(h));
theoretical=(range/variance).*exp(-range.^2/(2*variance));
plot(range,approxPDF,'b*',range,theoretical,'r');
title('SimulatedandTheoreticalRayleighPDFforvariance=0.5')
legend('SimulatedPDF','TheoreticalPDF')
xlabel('r-?');
ylabel('P®-? ');
grid;
theta=atan(y./x);
figure(2)
hist(theta);
[counts,range]=hist(theta,100);
step=range(2)-range(1);
approxPDF=counts/(step*sum(counts));
hold on
plotHandle=plot(range,approxPDF,'r');
set(plotHandle,'LineWidth',3.5);
axis([-2 2 0 max(approxPDF)+0.2])
hold off
title('SimulatedPDFofPhaseofRayleighDistribution');
xlabel('\theta--->');
ylabel('P(\theta)--->');
grid;