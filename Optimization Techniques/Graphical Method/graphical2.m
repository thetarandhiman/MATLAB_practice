clear all
clc

%% Input
C=[2,1];
A=[1 2; 1 1;1 -1; 1 -2; 1 0; 0 1]
B=[10; 6; 2; 1; 0; 0]

%% Plot
x1=0:1:max(B);
x21=(B(1)-A(1,1).*x1)./A(1,2);
x22=(B(2)-A(2,1).*x1)./A(2,2);
x23=(B(3)-A(3,1).*x1)./A(3,2);
x24=(B(4)-A(4,1).*x1)./A(4,2);
x21=max(0,x21);
x22=max(0,x22);
x23=max(0,x23);
x24=max(0,x24);
plot(x1,x21,'r',x1,x22,'b',x1,x23,'g',x1,x24,'y')
xlabel('x1')
ylabel('x2')
legend('x1+2x2=10','x1+x2=6','x1-x2=2', 'x1-2x2=1')
grid on

%% Intersecting points
sol=[];
for i=1:size(A,1)
  A1 = A(i,:)
  B1 = B(i,:)
  for j=i+1:size(A,1)
      A2 = A(j,:)
      B2 = B(j,:)
      A3 = [A1;A2]
      B3 = [B1;B2]
      X = inv(A3)*B3
      sol = [sol,X]
  end
end
sol
     sol=sol'
sol

%% Feasible region
X1 = sol(:,1);
X2 = sol(:,2);
C1 = find(X1+2*X2-10>0);
sol(C1,:)=[];
X1 = sol(:,1);
X2 = sol(:,2);
C2 = find(X1+X2-6>0);
sol(C2,:)=[];
X1 = sol(:,1);
X2 = sol(:,2);
C3 = find(X1-X2-2>0);
sol(C3,:)=[];
X1 = sol(:,1);
X2 = sol(:,2);
C4 = find(X1-2*X2-1>0);
sol(C4,:)=[];

%% Objective function
for i=1:size(sol,1)
   obj(i,:)=sum(sol(i,:).*C);
end

%% Optimal Solution
S = max(obj);
ans = find(obj==S);
opt_sol = sol(ans,:);
fprintf('Optimal Solution = ')
disp(opt_sol)
fprintf('Optimal Value = ')
disp(S)
