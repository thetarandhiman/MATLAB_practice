clear all;
clc;
n=input('No. of points: ');
for i = 1:n
    x(i) = input('Enter the value of x(i): ');
    f(i) = input('Enter the value of func f(i): ');
end
p=input('Points of interpolation: ');
for  i=1:n
    la(i)=1; lb(i)=1; lc(i)=1; ld(i)=1;
    for j=1:n
        if i~=j
            la(i)=((a-x(j))/(x(i)-x(j)))*la(i);
            lb(i)=((b-x(j))/(x(i)-x(j)))*lb(i);
            lc(i)=((c-x(j))/(x(i)-x(j)))*lc(i);
            ld(i)=((d-x(j))/(x(i)-x(j)))*ld(i);
        end
    end
end
new_a=0; new_b=0; new_c=0; new_d=0;
for i=1:n
    new_a=new_a+f(i)*la(i);
    new_b=new_b+f(i)*lb(i);
    new_c=new_c+f(i)*lc(i);
    new_d=new_d+f(i)*ld(i);
end
fprintf('Value of O(%f): %f',a,new_a);
fprintf('Value of O(%f): %f',b,new_b);
fprintf('Value of O(%f): %f',c,new_c);
fprintf('Value of O(%f): %f',d,new_d);