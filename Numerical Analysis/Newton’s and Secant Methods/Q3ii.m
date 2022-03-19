clear all
clc

fx= @(x) exp(-x)*(x^2+5*x+2)+1;
fdx= @(x) -exp(-x)*(x^2+5*x+2)+exp(-x)*(x*2+5);

a= -1.0; %initial guess
n= 100;
e= 0.00001;

for i=0:n
    if(fdx(a)~=0)
        b = a-fx(a)/fdx(a);
        if(abs(a-b)<=e)
            display(b);
            break
        else
            a=b;
        end
    else
        disp("Anything")
        break;
    end
end