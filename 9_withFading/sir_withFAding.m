clear all
close all
clc
SNR=0:4:40;
SNRn=10.^(SNR/10);
N=800; %Number of bits
M=100; % Number of Experiments
fBER=zeros(1,length(SNR));
for mo=1:M 
xbase=sign(randn(1,N)); %BPSK
cc=0.707*(randn(1,N)+sqrt(-1)*randn(1,N));
Sigpow=1;
for ss=1:length(SNR) %Assuming channel is known at the receiver
noipow=Sigpow/SNRn(ss); % AWGN channel
ybase=xbase.*cc+sqrt(noipow)*(randn(1,N));
yfa=conj(cc).*ybase; ydet=(sign(real(yfa)));
err_pos=find(ydet~=xbase);
BERa(ss)=length(err_pos)/N;
end
fBER=fBER+BERa;
end
 
 
% Theoretical Approximate (Analytical) formulae
BERana=1./(2*SNRn); %Plotting
semilogy(SNR,fBER/M,'k','LineWidth',3)
hold on
semilogy(SNR,BERana,'ko','LineWidth',3);
hold on
grid on
xlabel('SNR (dB)');
ylabel('BER');
legend('Flat Fading channel (Simulated)','Flat Fading (Theory)');
