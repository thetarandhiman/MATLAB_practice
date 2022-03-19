clear all
clc

a=11000 %Resistance ofr 18.33 cel
b=14000 %Resistance ofr 19.44 cel
e=0.001
N=(log(b-a)-log(e)/log(2))
N=ceil(N)
fprintf('The number of iterations is %d\n',N)
for i=1:N
    c=(a+b)/2;
    if f(a)*f(c)<0
        b=c;
    else
        a=c;
    end
end
fprintf('The resistance for 18.99 degree celsius is %f\n',c)
function y=f(x)
t=18.99;
T=t+273.15;
y=0.001129241+0.0002341077*log(x)+(8.775468*(log(x))^3)*10^-8-1/T;
end