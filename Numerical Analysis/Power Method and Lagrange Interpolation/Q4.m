clear all;
clc;
n=input('No. of points: ');
for i = 1:n
    x(i) = input('Enter the value of x(i): ');
    f(i) = input('Enter the value of func f(i): ');
end
p=input('Points of interpolation: ');
for i=1:n
    l(i)=1;
    for j=1:n
        if i~=j
            l(i)=l(i)*((p-x(j))/(x(i)-x(j)));
        end
    end
end
sum=0;
for i=1:n
    sum=sum+l(i)*f(i);
end
p
sum