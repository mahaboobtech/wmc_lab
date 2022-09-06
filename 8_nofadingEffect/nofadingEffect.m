clear all;
close all;
clc
snr = 0:1:20;
snrn = 10.^(snr/10);
n = 800;
m = 60;
fber = zeros(1,length(snr));
for mo= 1:m
    xbase= sign(randn(1,n));
    sigpow = 1;
    for ss= 1:length(snr)
        noipow= sigpow/snrn(ss);
        ybase= xbase+sqrt(noipow)*(randn(1,n));
        ydet= (sign((ybase)));
        err_pos = find(ydet~= xbase);
        bera(ss)=length(err_pos)/n;
    end
    fber= fber+bera;
end

beranaawgn= 0.5*exp(-snrn/2);
semilogy(snr,fber/m,'k', 'linewidth',3);
hold on 
semilogy(snr,beranaawgn,'k','linewidth',3);
hold on 
grid on 
xlabel('snr(db)');
ylabel('ber');
legend('awgn channel(simulated)','awgn channel (theory');
        