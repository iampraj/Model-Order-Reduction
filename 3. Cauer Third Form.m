clear all
clc
z=[-1 -3 -5 -20];
p=[-0.01 -2+4i -2-4i -10 -50];
k=1;
Gs=zpk(z,p,k);
sys=tf(Gs);
[num,den]=tfdata(sys, 'v');
n=max(size(den));
A=zeros(2*n-1,n);
H=zeros(1,2*n-2);
h=zeros(1,2*n-2);
A(1,:)=fliplr(den);
A(2,:)=fliplr(num);
H(1)=A(1,n)/A(2,n-1);
h(1)=A(1,1)/A(2,1);
for i=3:2*n-1
    for j=1:n-1
        A(i,j)=A(i-2,j+1)-h(i-2)*A(i-1,j+1)-H(i-2)*A(i-1,j+1);
    end
    h(i-1)=A(i-1,1)/A(i,1);
    l=find(A(i-1,:)~=0, 1, 'last');
    m=find(A(i,:)~=0, 1, 'last');
    H(i-1)=A(i-1,l)/A(i,m);
end
prompt = 'Enter the order of reduced model that you want to form.  ';
r=input(prompt);
s = tf('s');
if mod(r,2)==0
    Rs = 1/(h(r-1)+s*H(r-1)+1/(H(r)+h(r)/s));
    for i=r-2:-2:1
        Rs=1/(h(i-1)+s*H(i-1)+1/(Rs+H(i)+h(i)/s));
    end
end