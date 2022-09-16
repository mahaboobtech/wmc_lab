clc;            %Clears the command window
clear all;      %clears all the varibles used in previous program
close all;      %closes all pop up windows like graphs opened in previous window 
r=input('enter the length of shiftregister r= '); %reads the shift register length and stores in variable r
N=2^r-1;                                          %calculate PN_sequence length
tp=input('enter the valid tap array :');
in=input('enter the sequence of input data array of length r : ');

if r~=length(in)
    fprintf('\n \n error : length of input data array must be equal to the length  of shift registers: \n \n');
else
    out=in;
for k=1:N
    t_out=out(tp(1));
    for i=1:length(tp)-1
    t_out=xor(t_out,out(tp(i+1)));
    end;
    tr1=r;
    M_seq(k)=out(r);
 for j=1:r-1
    out(tr1)=d_ff(out(tr1-1));
    tr1=tr1-1;
   end;
   out(1)=t_out;
   if k~=N
   if out==in
       fprintf('\n \n error : given tap input array is not valid : \n \n');
       break;
   end;
   end;
   if k==N
      if out==in
      fprintf('lenth of the m_sequence N = %d \n',N);
      fprintf('M_sequence is : \n');
      disp(M_seq);
      corre=correlation(M_seq,N);
      t=-2*N:1:2*N;
      grid on;
      plot(t,corre);
      grid on;axis([-2*N-1 2*N+1 -1 1.5]);
      title('autocorrelation of M-sequence : ');
      xlabel('timeperiod');
      ylabel('amplitude');
  else
      fprintf(' \n \n error : given tap input array is not valid :\n \n');
  end; 
  end;
end;
end;

D=input('Enter the input data sequence: ');
D(D==0)= -1;
M_seq(M_seq==0)=-1;
td=D;
ld=length(D);
td(1:N)=D(1)*M_seq;
for i=2:ld
    td(1,length(td)+1:length(td)+N)=D(i)*M_seq;
end;
Tb=1;
Tpn=Tb/N;
fc=3*N;
fs=150*fc;
ts=1/fs;
k=0;
for i=1:N
if M_seq(i)==1
        M_seq1(1,k+1:k+fs/N)=1;
        k=length(M_seq1);
else
        M_seq1(1,k+1:k+fs/N)=-1;
 
        k=length(M_seq1);
end;        
end;
 
k=0;
for i=1:ld
if D(i)==1
        D1(1,k+1:k+fs)=1;
        k=length(D1);
else
        D1(1,k+1:k+fs)=-1;

        k=length(D1);
end;
end;
k=0;
for i=1:ld*N
if td(i)==1
        td1(1,k+1:k+fs/N)=1;
        k=length(td1);
else
        td1(1,k+1:k+fs/N)=-1;
        k=length(td1);
end;
end;
t=(0:1:fs*ld-1)*ts;
tm=(0:1:fs-1)*ts;
c=cos(2*pi*fc*t);
BPSK=c.*td1;
figure();
subplot(4,1,1);
plot(t,D1,'b','linewidth',1);
grid on;   %Shows grid lines in the graph
legend('NRZ coded Data signal ');    %Shows graph names given
 
subplot(4,1,2);
plot(tm,M_seq1,'b','linewidth',1);
grid on;   %Shows grid lines in the graph           
legend('NRZ coded M_sequence ');    %Shows graph names given
 
subplot(4,1,3);
plot(t,td1,'b','linewidth',1);
grid on;   %Shows grid lines in the graph
legend('NRZ coded spread spectrum modulated signal');    %Shows graph names given
subplot(4,1,4);
plot(t,BPSK,'b','linewidth',1);
grid on;   %Shows grid lines in the graph
legend('DSSS_BPSK Modulated Signal');    %Shows graph names given

% input 1 : 3
% input 2 :[3 1]
% input 3 :[1 0 0]
% input 4 :[1001010]
