clc;

%g=@(x)x-x^3-4*x^2+10;  %a part
%g=@(x)sqrt((10/x)-(4*x)); %b part
%g=@(x)(0.5*sqrt(10-(x^3))); %c part
%g=@(x)sqrt(10/(4*x)); %d part
g=@(x)(x-((x^3+4*x^2-10)/(3*x^2+8*x))); %e part
x0=1.5;
e=0.001;
N=input('Enter value of max number of iterations=');
i=1;

while(i<=N)
    x1=g(x0);
    if(abs(x1-x0)<=e || abs(x1-x0)/abs(x0)<e)
       fprintf('value of x1=%f and iteration taken=%d',x1,i);
       break;
    else
        i=i+1;
        x0=x1;
    end
end
x1
