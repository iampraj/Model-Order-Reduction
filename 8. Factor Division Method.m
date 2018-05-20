clc
clear all
z=[-1 -5 -5 -7 -7 -15];
p=[-0.1+0.05i -0.1-0.05i -2 -3 -10 -20 -50];
k=1000;
Gs=zpk(z,p,k);
sys=tf(Gs);
[N,D]=tfdata(sys,'v');
[psort,pspos]=sort(real(p));
n=max(size(p));
% rth order reduced model
r=3;
b=p(pspos(1:1:n-r));
DD=poly2sym(N);
DR=poly2sym(poly(b));
C=taylor(DD/DR,'Order',r);
num=sym2poly(C);
pred=p(pspos(n-r+1:1:n));
den=poly(pred);
Rs=tf(num,den);