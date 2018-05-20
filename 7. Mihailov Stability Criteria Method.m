clc
clear all
Num=[200 6500 5528 116004 110520 32800];
Den=[1 109 925.3 2459.2 2543.3 1900.25 18.75];
Gs=tf(Num,Den);
Gssym=poly2sym(Num)/poly2sym(Den);
Gstay=taylor(Gssym);
n=max(size(Den));
denjw=Den.*(1i).^(n-1:-1:0);
if mod(n,2)==0
    Do=denjw(1:2:n)/1i;
    De=denjw(2:2:n);
else
    Do=denjw(2:2:n)/1i;
    De=denjw(1:2:n);
end
Der=roots(De).^0.5;
Dor=roots(Do).^0.5;
Drs=sort([0 Der' Dor']);
% For rth order reduced model
r=2;
syms w x
assume(w>=0)
Dene(w)=poly2sym(De,w);
Dene(w)=subs(Dene, w, w^2);
Deno(w)=poly2sym(Do,w);
Deno(w)=w*subs(Deno, w, w^2);
do(w)=w;
de(w)=(w*w-Drs(2)*Drs(2));
if mod(r,2)==0
    for k=3:2:r
        do(w)=do(w)*(w*w-Drs(k)*Drs(k));
        de(w)=de(w)*(w*w-Drs(k+1)*Drs(k+1));
    end
else
    for k=3:2:r-1
        do(w)=do(w)*(w*w-Drs(k)*Drs(k));
        de(w)=de(w)*(w*w-Drs(k+1)*Drs(k+1));
    end
    do(w)=do(w)*(w*w-Drs(r)*Drs(r));
end
a=double(Dene(Drs(1))/de(Drs(1)));
b=double(Deno(Drs(2))/do(Drs(2)));
d(w)=a*de(w)+b*do(w)*1i;
d=d(x/1i);
nhelp=sym2poly(d*Gstay);
num=nhelp(end-r+1:1:end);
den=sym2poly(d);
Rs=tf(num,den);