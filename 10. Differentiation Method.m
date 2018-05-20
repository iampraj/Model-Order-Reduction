clear all
clc
z=[-1 -5 -5 -7 -7 -15];
p=[-0.1-0.05i -0.1+0.05i -2 -3 -10 -20 -50];
k=1000;
Gs=zpk(z,p,k);
[Num,Den]=tfdata(Gs,'v');
n=max(size(Den))-1;
syms x;
% rth order reduced model
r=2;
num=poly2sym(Num);
den=poly2sym(Den);
for q=1:n-r
    dd=x*diff(den)/(n+1-q);
    den=den-dd;
    nn=x*diff(num)/(n-q);
    num=num-nn;
end
num=sym2poly(num);
den=sym2poly(den);
Rs=tf(num,den);