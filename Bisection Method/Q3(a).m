a=input('Enter the value of a')
b=input('Enter the value of b')
h=1
n=(b-a)/h
for i=1:n
    p=f(a+(i-1)*h)*f(a+i*h)
    if p<0
        a1=a+(i-1)*h
        b1=a+i*h
        fprintf('The equation has the root within the interval [%f , %f]\n',a1,b1)
    end
end

e=input('Enter the value of epsilon')
N=(log(b-a)-log(e)/log(2))
N=ceil(N)
fprintf('The number of iterations is %d\n',N)
for i=1:N
    c=(a1+b1)/2
    if f(a1)*f(c)<0
        b1=c
    else
        a1=c
    end
end
fprintf('The root of the equation is %f',c)
function y=f(x)
y=x*x-29
end