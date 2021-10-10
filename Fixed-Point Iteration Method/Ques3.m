clc;

x0=1.5;
e=0.001;  %tolerance
N=input('Enter the max number of iterations:');

%g=@(x) (1/(4*x) - 1/(tan(x)) -x);
%OR
g=@(x) atan(4*x);
i=1;

while(i<=N)
    x1=g(x0);
    if(abs(x1-x0)<=e)
        break;
    else
        i=i+1;
        x0=x1;
    end
end
Smallest_root=x1
Second_Smallest_root=x1 + pi