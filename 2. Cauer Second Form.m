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
A(1,:)=fliplr(den);
A(2,:)=fliplr(num);
for i=3:2*n-1
    for j=1:n-1
        A(i,j)=A(i-2,j+1)-A(i-2,1)*A(i-1,j+1)/A(i-1,1);
    end
end
h=zeros(1,2*n-2);
for i=1:2*n-2
    h(i)=A(i,1)/A(i+1,1);
end
% Rs2=(h(2)*h(3)*h(4)+(h(2)+h(4))*s)/(h(1)*h(2)*h(3)*h(4)+(h(1)*h(2)+h(1)*h(4)+h(3)*h(4))*s+s^2);
prompt = 'Enter the order of reduced model that you want to form.  ';
r=input(prompt);
s = tf('s');
Rs = 1/(h(2*r-1)+s/h(2*r));
for i=r-1:-1:1
    Rs=1/(h(2*i-1)+1/(Rs+h(2*i)/s));
end