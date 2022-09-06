d= input('enter the input dat sequece');
d(d==0)= -1;
m_seq(m_seq==0)=-1;
td = d;
led = length(d);
td(1:n)= d(1)*m_seq;
for i = 2:td
    td(1,length(td)+1:length(td)+n)= d(i)*m_seq;
end
tb= 1;
tpn = tb/n;
fc = 3*n;
fs=150*fc;
ts= 1/fs;
k= 0;
for i = 1:n
    if m_seq(i)==1
        m_seq1(1,k+1:k+fs/n)=1;
        k= length(m_seq1);
    else
        m_seq1(1,k+1:k