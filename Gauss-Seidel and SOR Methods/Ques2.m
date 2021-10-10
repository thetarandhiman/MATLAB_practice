%SOR Algo
clear all;
clc;

n = input('Enter number of equations, n: ');
A = zeros(n,n+1);
x1 = zeros(1,n);

A=[4,2,3,8; 3,-5,2,-14; -2,3,8,27];
x1 = [0;0;0];

tol = input('Enter tolerance, tol = ');
m = input('Enter max no. of iterations, m: ');
w = input('enter the parameter w (omega): ');

k=1;
while k<=m
    err = 0;
    for i = 1 : n
        s = 0;
        for j = 1 : n
            s = s-A(i,j)*x1(j);
        end
        s = w*(s+A(i,n+1))/A(i,i);
    end
end
err
s