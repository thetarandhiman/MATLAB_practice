% x+2y-3z = 6
% 3x+5y+6y = 9
% 2x+4y-3z = 12

A = [ 1,2,-3; 3,5,6; 2,4,-3]
B = [6;9;12]

S1 = A\B  % B by A
x = S1(1)
y = S1(2)
z = S1(3)
%or method
I = inv(A);
S2 = I*B
%or 
S3 = linsolve(A,B)