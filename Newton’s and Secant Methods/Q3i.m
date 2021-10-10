clear all
clc

f=@(x) x^2-17;
fdx=@(x) 2*x;

a=4;
e=0.00001;
for i=0:1000
    if(fdx(a)>0)
        b= a- f(a)/fdx(a)
        break;
    else
        a=b
    end
end
%b is root