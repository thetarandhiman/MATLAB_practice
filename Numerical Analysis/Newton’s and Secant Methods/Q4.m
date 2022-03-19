clear all
clc

fx=@(x) 9*exp(-x)*sin(2*pi*x)-3.5;
fdx=@(x) -9*exp(-x)*sin(2*pi*x)+18*pi*exp(-x)*cos(2*pi*x);

n=100;
h=0.01;

for i=0 : h : n
    if(fx(i)*fx(i+h)<0)
        a=(i);
        b=(i+h);
        break
    end
end

e = 0.00001;

a
b

for i=0:n
    if(fdx(a)~=0)
        b=a-fx(a)/fdx(a);
        if(abs(a-b)<=e)
            b
            break
        else
            a=b;
        end
    else
        disp("anything")
        break;
    end
end