clear all;
clc;
A = [ 1 1 0 0; 1 2 0 1; 0 0 3 3; 0 1 2 3;];
x = [1 ; 1; 0; 1;];
n=4;
K_old=1;
K_new=0;
tol=0.0001;

while abs(K_old-K_new)>tol
    y=A*x;
    K_old=K_new;
    K_new=abs(y(1));
    for i=1:n
        if K_new<abs(y(i))
            K_new = abs(y(i));
        end
    end
    x=y/K_new;
end
K_new
x
