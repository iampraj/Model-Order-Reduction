clc
clear all
z=[-1 -5 -5 -7 -7 -15];
p=[-0.1+0.05i -0.1-0.05i -2 -3 -10 -20 -50];
k=1000;
Gs=zpk(z,p,k);
sys=tf(Gs);
[N,D]=tfdata(sys,'v');
n=max(size(D));
% rth order reduced model
r=3;
num=N(n-r+1:1:n);
den=D(n-r:1:n);
Rs=tf(num,den);