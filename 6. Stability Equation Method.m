% For stable system only
clear all
clc
z=[-0.5 -1-0.8i -1+0.8i -10 -20];
p=[-0.01 -0.5-1i -0.5+i -3 -5 -10];
k=200;
Gs=zpk(z,p,k);
sys=tf(Gs);
[num,den]=tfdata(sys,'v');
n=max(size(den));
if mod(n,2)==1
    num_o=num(2:2:n);
    num_e=num(3:2:n);
else
    num_o=num(3:2:n);
    num_e=num(2:2:n);
end
if mod(n,2)==1
    den_o=den(2:2:n);
    den_e=den(1:2:n);
else
    den_o=den(1:2:n);
    den_e=den(2:2:n);
end
dro=-1*roots(den_o/den_o(end))';
dros=sort(dro,'ascend');
dre=-1*roots(den_e/den_e(end))';
dres=sort(dre,'ascend');
nro=-1*roots(num_o/num_o(end))';
nros=sort(nro,'ascend');
nre=-1*roots(num_e/num_e(end))';
nres=sort(nre,'ascend');
s=tf('s');
% 2nd Order Reduced Model
D2=den_o(end)*s+den_e(end)*(1+s*s/dres(1));
N2=num_o(end)*s+num_e(end);
R2s=N2/D2;
% 3rd Order Reduced Model
D3=den_o(end)*s*(1+s*s/dros(1))+den_e(end)*(1+s*s/dres(1));
N3=num_o(end)*s+num_e(end)*(1+s*s/nres(1));
R3s=N3/D3;