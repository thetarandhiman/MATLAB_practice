clc;

x0=1;
e=0.01;
N=input('Enter the max number of iterations:');
i=1;

g=@(x)((7/22)*(asin(-1*x/2)) + 2);
while(i<=N)
    x1=g(x0);
    if(abs(x1-x0)<=e || abs(x1-x0)/abs(x0)<e)
        fprintf('Solution accurate to within 10^-2 is %f',x1);
        break;
    else
        i=i+1;
        x0=x1;
    end
end