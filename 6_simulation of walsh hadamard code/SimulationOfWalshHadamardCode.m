clc ;
clear all;
N =2;
H = [0 0;0 1];
codesize = input('enter codesize value');
if bitand(codesize,codesize-1)==0
    while(N~=codesize)
        N=N*2;
        H=repmat(H,[2,2]);
        [m,n]=size(H);
        for i=m/2+1:m
            for j=n/2+1:n
                H(i,j)=~H(i,j);
            end
        end
    end
else
    disp('invalid codesize:codemust be the power of 2');
end

disp(H);