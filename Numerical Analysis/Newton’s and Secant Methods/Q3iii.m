clear all
clc

fx= @(x) x- 2*sin(x);
fdx= @(x) 1-2*cos(x);
n=100;
h=1;
for i= -n : h : n
    if(fx(i)*fx(i+h)<0)
        a=-(i);
        b=-(i+h);
        break
    end
end
e=0.00001;

a
b
for i=0:n
    if(fdx(a)~=0)
        b=a-fx(a)/fdx(a);
        if(abs(a-b)<=e)
            display(b);
            break
        else
            a=b;
        end
    else
        disp("anything")
        break;
    end
end