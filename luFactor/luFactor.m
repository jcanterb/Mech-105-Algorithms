function [L,U,P] = luFactor(A)
%% 
% LU DECOMPOSITION FUNCTION
% Created by Joe Canterbury on 03.25.2018
% 
% DESCRIPTION:
% This function uses the process of LU decomposition with partial pivoting 
% to factor a matrix as inputted by the user. This factorization can be 
% used to solve the system of equations the matrix represents. Given a 
% matrix, this function will return the lower diagonal and upper diagonal 
% matrices and pivot matrix cooresponding to the matrix.
%
% Inputs: A - matrix that will be decomposed
% 
% Outputs: L - Lower diagonal matrix including the coeffecients used to
%          eliminate and produce U matrix
%          U - Upper diagonal matrix including the values of the matrix
%          once it is reduced through guass elimination
%          P - This matrix indentifies which rows where pivoted in the
%          process of decomposition
%


P = [0 0 0 ; 0 0 0 ; 0 0 0];
L = [1 0 0; 0 1 0; 0 0 1];
%% Initial Partial Pivoting of Matrix
% First consider special cases where two rows are equal in 1st column
if abs(A(1,1)) == abs(A(2,1)) && abs(A(1,1)) > abs(A(3,1))   ||   abs(A(2,1)) == abs(A(3,1)) && abs(A(2,1)) < abs(A(1,1)) || abs(A(1,1)) == abs(A(2,1)) && abs(A(2,1)) == abs(A(3,1))
    P = [ 1 0 0; 0 1 0; 0 0 1 ]; % If already in correct order pivot matrix should not change the U matrix
elseif abs(A(1,1)) == abs(A(3,1)) && abs(A(1,1)) > abs(A(2,1))
    P = [ 1 0 0; 0 0 1; 0 1 0]; % If 1st and 3rd rows same and greater than 2nd pivot 2nd to bottom
elseif abs(A(2,1)) == abs(A(3,1)) && abs(A(2,1)) > abs(A(1,1)) || abs(A(1,1)) == abs(A(2,1)) && abs(A(1,1)) < abs(A(3,1))
    P = [ 0 0 1; 0 1 0; 1 0 0]; % If 2nd and 3rd rows same and greater than 1st pivot 1st to bottom
elseif abs(A(1,1)) == abs(A(3,1)) && abs(A(1,1)) < abs(A(2,1))
    P = [ 0 1 0; 1 0 0; 0 0 1 ]; % If 1st and 3rd rows same and lower than 2nd pivot 1st/3rd to bottom
else % Check for maximum in each column and pivot accordingly
    for i = (1:3) 
        if max(abs(A(:,1))) == abs(A(i,1)) % if a row is the max assign that to the top row
            P(i,:) = [ 1 0 0 ];
        elseif min(abs(A(:,1))) == abs(A(i,1)) % if a row is minimum assign that row to the bottom row
            P(i,:) = [ 0 0 1 ];
        else % assign other row to middle row 
            P(i,:) = [ 0 1 0 ];
        end
    end
end
U = P*A; % use pivot matrix to determine starting U matrix
%% Determine coefficients for elimination
for i = 2:3 
    L(i,1) = U(i,1)/U(1,1); % find coefficient and place in L matrix
    U(i,:) = U(i,:) - L(i,1)*U(1,:); % calculate matrix row after elimination
end
%% Pivot for second time 
if U(3,2) > U(2,2) % determine if you must pivot
    PU = [ 1 0 0; 0 0 1; 0 1 0 ]; % use PU to pivot the U matrix
    P = [ P(1,:); P(3,:); P(2,:)]; % alter P matrix to account for 2nd pivot
    U = PU*U; 
    L = [ L(1,:); L(3,1) 1 0 ; L(2,1) 0 1 ]; % change L matrix to include pivot
end
%% Eliminate 2nd time
L(3,2) = U(3,2)/U(2,2); % Determine next elimination coefficient
U(3,:) = U(3,:) - L(3,2)*U(2,:); % Calculate elimination step and put into U 
end
