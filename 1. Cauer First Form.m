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
A(1,:)=den;
for i=1:n-1
    A(2,i)=num(i+1);
end
for i=3:2*n-1
    for j=1:n-1
        A(i,j)=(A(i-1,1)*A(i-2,j+1)-A(i-1,j+1)*A(i-2,1))/A(i-1,1);
    end
end
H=zeros(1,2*n-2);
for i=1:2*n-2
    H(i)=A(i,1)/A(i+1,1);
end
% RNum=[H(2)*H(3)*H(4) H(2)+H(4)];
% RDen=[H(1)*H(2)*H(3)*H(4) H(1)*H(2)+H(1)*H(4)+H(3)*H(4) 1];
% Rs2=tf(RNum,RDen);
prompt = 'Enter the order of reduced model that you want to form.  ';
r=input(prompt);
s = tf('s');
Rs = 1/( H(2*r-1)*s + (1/H(2*r)) );
for i=r-1:-1:1
    Rs = 1/( H(2*i-1)*s + (1/(H(2*i)+Rs)) );
end