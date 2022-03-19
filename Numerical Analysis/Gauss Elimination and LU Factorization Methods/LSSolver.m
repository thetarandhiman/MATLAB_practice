%Linear Equation Solver
clear all;
clc;

A= input("Enter Matrix A: ");
B= input("Enter Matrix B: "); 
n=max(size(A));
m=eye(n);

for i=1:n
    for j= i+1:n
        if A(i,i)==0
         t=A(i,:);
         A(i,:)=A(j,:);
         A(j,:)=t;
        end
    end    
end

for i=1:n
    for j=i+1:n
        m(j,i)=A(j,i)/A(i,i);
        A(j,:)=A(j,:)-m(j,i)*A(i,:);
        B(j,:)=B(j,:)-m(j,i)*B(i,:);
    end
end

U=A
L=m
x= zeros(n,1);
x(n,:)=B(n,:)/A(n,n);

for i=n-1:-1:1
    x(i,:)=(B(i,:)-A(i,i+1:n)*x(i+1:n,:))/A(i,i);
end
x
