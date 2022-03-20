%% Question of lab manual-assignment 3
format short
clear all
clc
%% Input
A = [-1,1; 1,1];
b = [1; 2];
C = [1; 2];
%n = 2;
%s = eye(size(A,1));
[m,n] = size(A);
s=eye(m);        %identity matrix of order m 
A = [ A s b]     %concatenating the matrices and vectors
%cost = zeros(1, size(A,2));
cost = zeros(1,n+m+1);
cost(1:n) = C; 

%bv = n+1:1:size(A,2)-1 %basic variables
bv = n+1:1:n+m
zjcj = cost(bv)*A-cost;  %at this point, cost(bv) is zero
zcj = [zjcj; A];   %constructing the complete matrix

simplextable = array2table(zcj);
simplextable.Properties.VariableNames(1:size(zcj,2)) = { 'x1', 'x2', 's1', 's2', 'sol'}

%%
flag = true;

while flag
    if any(zjcj<0)
        fprintf('The curent BFS is not optimal');
        
        zc = zjcj(1:n+m);  % first row of zjcj leaving the solution column
        [val, pvt_col] = min(zc);  % checking the minimum value of zjcj for maximization problem
        if(A(:,pvt_col)<0) % if all(A(:,pvt_col)<=0)
            fprintf('LPP is unbounded & all entries (solution) are in column %d', pvt_col)
        else
            sol = A(:, n+m+1);
            col = A(:, pvt_col);
            for i=1:m
                if(A(i,pvt_col)>0)   %if col(i)>0
                    ratio(i) = sol(i)/col(i);
                else
                    ratio(i) = inf;
                end
            end
            [leav_var, pvt_row] = min(ratio);
        end
            bv(pvt_row) = pvt_col
            pvt_key = A(pvt_row, pvt_col);
            A(pvt_row, :) = A(pvt_row, :)./pvt_key %A(:, pvt_row) = A(:,pvt_row)/pvt_key 
            
            for i=1:m
                if i~=pvt_row
                    A(i,:) = A(i,:)-A(i, pvt_col).*A(pvt_row,:);
                end
            end
            
            zjcj = zjcj-zjcj(pvt_col).*A(pvt_row,:);
            zcj = [zjcj;A];
            table = array2table(zcj);
            
            table.Properties.VariableNames(1:n+m+1) = { 'x1', 'x2', 's1', 's2', 'sol'}
    else
        flag = false;
        fprintf('The current BFS is optimal.')  
    end
end