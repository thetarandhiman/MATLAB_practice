%% Question 1: 
% Z = 3x1+ 2x2
% 2x1 + 4x2 <= 8
% 3x1 + 5x2 >= 15
%x1, x2 >=0

format short   % calculate values upto 4 decimal places
clear all
clc 

%% Phase 1: Input the parameters
C = [3 ; 2]      % coefficients of variables in objective function
A = [ 2,4; 3,5; 1,0; 0,1 ] % coefficients of variables in constraints 
B = [8 ; 15; 0; 0 ]    % R.H.S. elements of constraints   
 
%% Phase 2: Plot the graph

x1 = 0:1:max(B); %value of x1
x21 = (B(1) - A(1,1).*x1)./A(1,2);  % value of x2 for constraint 1
x22 = (B(2) - A(2,1).*x1)./A(2,2);  % value of x2 for constraint 2

x21 = max(0,x21);  % keeping values of x2 >=0
x22 = max(0,x22);

plot( x1, x21, 'r', x1, x22, 'k')
xlabel('x1');
ylabel('x2');
title('x1 vs x2');
legend('2x1 + 4x2 = 8' , '3x1 + 5x2 = 15');

grid on

%% Phase 3: finding corner points with the axes

%cx1  = find(x1==0);
%cx21 = find(x21==0);
%cx22 = find(x22==0);

%% Phase 4: finding the intersecting points of constraints

sol = [];

for i=1:size(A,1)
    A1 = A(i,:);
    B1 = B(i,:);
    for j = i+1:size(A,1)
        A2 = A(j, :);
        B2 = B(j, :);
        
        A3 = [A1 ; A2];  %%solving the obtained matrix using equations A3X = B3
        B3 = [B1; B2];
        X = A3\B3; % or inv(A3)*B3
        
        sol = [sol, X]; %% concatenating solution matrix with the intersecting points
    end
end
sol
    sol = sol'
sol

x1 = sol(:,1); %% 1st column as solution of x1
x2 = sol(:,2); %% 2nd column as solution of x2

%% Phase 5: Finding feasible region

c1 = find(2.*x1 + 4.*x2 - 8 > 0);
sol(c1,:) = [];
c2 = find(3.*x1 + 5.*x2 - 15 < 0);
sol(c2) = [];

%% Phase 6: Computing objective function 
for i=1:size(sol,1)
    obj(i, :) = sum(sol(i, :).*C);
end

%% Phase 7: Finding optimal solution

%min_value = min(obj) %computing minimum
max_value = max(obj) %computing maximum
ans = find(obj==max_value);
opt_sol = sol(:, ans)
fprintf('Optimal Solution = ')
disp(opt_sol)
fprintf('Optimal Value = ')
disp(max_value)