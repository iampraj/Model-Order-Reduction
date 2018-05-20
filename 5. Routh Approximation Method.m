clear all
clc
z=[-3 -2-10i -2+10i -20 -25];
p=[-2 -2 -15 -1-5i -1+5i -50];
k=1;
Gs=zpk(z,p,k);
sys=tf(Gs);
[num,den]=tfdata(sys,'v');
n=max(size(den));
m=ceil(n/2);
num_r=[0 num(n:-1:2)];
den_r=fliplr(den);
Gs_reci=tf(num_r,den_r);
DArr=zeros(n,m);
alpha=zeros(1,n-1);
DArr(1,:)=den_r(1:2:n);
if mod(n,2)==0
    DArr(2,:)=den_r(2:2:n);
else
    for i=1:m-1
        DArr(2,i)=den_r(2*i);
    end
end
alpha(1)=DArr(1,1)/DArr(2,1);
for i=3:n
    for j=1:m-1
        DArr(i,j)=DArr(i-2,j+1)-alpha(i-2)*DArr(i-1,j+1);
    end
    alpha(i-1)=DArr(i-1,1)/DArr(i,1);
end
NArr=zeros(n-1,m-1);
beta=zeros(1,n-1);
NArr(1,:)=num_r(2:2:n);
if mod(n,2)==1
    NArr(2,:)=num_r(3:2:n);
else
    for i=1:m-1
        NArr(2,i)=num_r(2*i+1);
    end
end
beta(1)=NArr(1,1)/DArr(2,1);
for i=3:n-1
    for j=1:m-2
        NArr(i,j)=NArr(i-2,j+1)-beta(i-2)*DArr(i-1,j+1);
    end
    beta(i-1)=NArr(i-1,1)/DArr(i,1);
end
beta(n-1)=NArr(n-1,1)/DArr(n-1,1);;
s=tf('s');
P2=beta(2)+alpha(2)*beta(1)*s;
Q2=1+alpha(2)*s+alpha(1)*alpha(2)*s^2;
R2s_reci=P2/Q2;
[a,b]=tfdata(R2s_reci,'v');
a=fliplr(a);
b=fliplr(b);
a=[0,a(1:max(size(a))-1)];
R2s=tf(a,b);