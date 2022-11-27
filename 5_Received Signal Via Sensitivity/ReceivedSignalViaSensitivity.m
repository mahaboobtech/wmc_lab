pt = 10*10^-3;
f = 1*10^9;
c = 3 *10^8;
lam = c/f;
d0 = 1;
k =(lam/(4*pi*d0))^2;
d= 1.9;
gam= 2;

prfriss = pt*k*(d0./d).^gam;
gam= 4.5;
pr = pt*k*(d0/d)^gam;

vari= 4;
pmin = 10*log10(pr/4);
x = (pmin-10*log10(pt)-10*log10(k)+10*gam*log10(d/d0))/vari;
prob_req= qfunc(x);
% make sure this below line
disp(vari);
disp(pmin);
disp(x);
disp(prob_req);
