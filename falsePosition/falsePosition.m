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

%% Determine defaults based on input

if nargin > 5 % check if too many argu
    error('Too many inputs')
elseif nargin == 3 % check if 3 argu and default the maxiter and es
    maxiter = 200;
    es = 0.0001;
elseif nargin == 4 % check if only maxiter defaults
    maxiter = 200;
elseif nargin == 5 % do nothing if argu is 5
else % if any less than 3 too few
    error('Too few inputs')
end

%% Preallocate Variables
iter =0; % iterations start at 0
ea = 100; % begin error at 100% so that function proceeds through while statement
root = 0; % initial root used for first % error must be 0 to yield 100% error

%% begin calc


while ea >= es && iter < maxiter % check if error and iteration limits met

    if func(0) == 0 %special case where root is at x=0 but function never changes sign (this is just a common case)
        xr = 0;
        iter = 1;
        ea = 0;
        break % this case ends function 

    elseif func(xl)*func(xu) > 0 % if no sign change occurs then no roots or multiple roots between brackets
    error('Either no roots in interval or multiple roots are in interval. Graphing function and determining interval recommended')
    end

    xr = root; % set xr as old root before calculating new for error purposes
    root = (xu - (func(xu)*(xl-xu))/(func(xl)-func(xu))); % using point slope equation calculate new root
    if func(xu) == 0 || func(xl) == 0 %special case where root was guessed we check for function at guesses
        error('you guessed the root')
    end
    if func(root)*func(xu)<0 % if sign change is between new root and upper limit new root becomes lower limit
        xl = root;
    elseif func(root)*func(xl)<0 % if sign change is between new root and lower limit new root becomes upper limit
        xu = root;
    end 
    iter = iter+1; % iteration counter
    
    ea = abs(((xr - root)/root) * 100); % calculate relative percent error using  old root xr
    
end

fx = func(root); % define fx as last root f(estimation)
