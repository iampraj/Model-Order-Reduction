clear all
clc
z=[-2 -3-4i -3+4i -10 -15];
p=[-1 -1 -4 -1-2i -1+2i -20];
k=1;
Gs=zpk(z,p,k);
sys=tf(Gs);
[num,den]=tfdata(sys,'v');
n=max(size(den));
m=ceil(n/2);
DenArr=zeros(n,m);
NumArr=zeros(n-1,m-1);
DenArr(1,:)=den(1:2:n);
if mod(n,2)==0
    DenArr(2,:)=den(2:2:n);
else
    for i=1:m-1
        DenArr(2,i)=den(2*i);
    end
end
NumArr(1,:)=num(2:2:n);
if mod(n,2)==1
    NumArr(2,:)=num(3:2:n);
else
    for i=1:m-1
        NumArr(2,i)=num(2*i+1);
    end
end
for i=3:n
    for j=1:m-1
        DenArr(i,j)=DenArr(i-2,j+1)-DenArr(i-2,1)*DenArr(i-1,j+1)/DenArr(i-1,1);
    end
end
for i=3:n-1
    for j=1:m-2
        NumArr(i,j)=NumArr(i-2,j+1)-NumArr(i-2,1)*NumArr(i-1,j+1)/NumArr(i-1,1);
    end
end
prompt='Order of reduced model = ';
r=input(prompt);
Rnum=zeros(1,r);
for i=1:2:r
    Rnum(i)=NumArr(n-r,(i+1)/2);
end
for i=2:2:r
    Rnum(i)=NumArr(n-r+1,i/2);
end
Rden=zeros(1,r+1);
for i=1:2:r+1
    Rden(i)=DenArr(n-r,(i+1)/2);
end
for i=2:2:r+1
    Rden(i)=DenArr(n-r+1,i/2);
end
Rs=tf(Rnum,Rden);