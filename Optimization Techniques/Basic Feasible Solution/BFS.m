%Max. z = x1 + 2x2, subject to − x1 + x2 ≤ 1, x1 + x2 ≤ 2, x1, x2 ≥ 0
% Standard form: x1 + x2 + s1 = 1, x1 + x2 + s2 = 2  -> s1 & s2 are slack
% variables
format short
clear all
clc

%% Input 
C = [1, 2, 0, 0];  %% coeff of x1 , x2, s1, s2 resp.
A = [-1, 1, 1, 0; 1, 1, 0, 1];
b = [1 ; 2];
[m,n] = size(A); %% m = no. of constraints, n = no. of variables
%%
count = 0;

ncm = nchoosek(n,m); 
% number of combinations that can be made to equate (n-m) variables to zero
% -> total number of basic solutions ^^

pairs = nchoosek(1:n,m); %pairs of variables that can be made zero 

solution=[];
%%
if n>m
   for i = 1:ncm
       y = zeros(n,1);
       B = A(:,pairs(i,:));
       x=B\b;
  
       if (x>=0 & x~=inf & x~=-inf)
           y(pairs(i,:)) = x;
           solution = [solution y];         
           count=count+1;
       end
       
   end
   
   fprintf('Basic feasible solution\n');
   for i=1:count
       disp(solution(i,:))
   end
   
else
   fprintf('No. of equations are greater than no. of variables');
end

%% Optimal Solution
for i = 1:size(solution,1)
   obj(i,:) = sum(solution(i,:).*C);
end

obj

S = max(obj);
p = find(obj==S);
os = solution(p,:);
fprintf('Optimal Solution = ');
disp(os)
fprintf('Optimal Value = ');
disp(S)