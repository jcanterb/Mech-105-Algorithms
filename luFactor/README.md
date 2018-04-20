LU Decomposition
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
