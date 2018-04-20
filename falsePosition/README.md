False Position
function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%%
%FALSE POSITION ROOT APPROXIMATION
%Created by Joe Canterbury on 02.17.2018
%
%DESCRIPTION:   Function uses false position method to find the root of a 
%function. Select bracketing guesses (xl,xu) such that between the guesses 
%a root is found on the function. This .m file will approximate the root 
%to a specified accuracy/error or number of iterations as entered by the 
%user. Input the function you wish to find root of as '@(x) expression' (in
%example, input "falsePosition( @(x) x^3 +x^2 +1, xl, xu, es, maxiter)"
%
% --------WARNING FUNC INPUT MUST BE EXTREMELEY SPECIFIC------------
%                ENTER FUNC AS '@(x) x^3 +x^2 +1 etc...'
%                       
%
% INPUTS: func - function to find roots of ( MUST BE ENTERED AS '@(x) function of x' )
%         xl - lower guess, used as bracket
%         xu - upper guess
%         es - desired relative percent error of estimation (defaults to 0.0001%)
%         maxiter - maximum iteration (defaults to 200)
%
% OUTPUTS: root - approximated root of the function
%          fx - evaluated function at root
%          ea - approximated relative percent error of root
%          iter - number of iterations program used
%
% --------WARNING FUNC INPUT MUST BE EXTREMELEY SPECIFIC------------
%                ENTER FUNC AS '@(x) x^3 +x^2 +1 etc...'
%
