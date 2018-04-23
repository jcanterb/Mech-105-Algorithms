# False Position Function

False Position is a root finding method employed in the CSU Numerical Methods class. This function finds the roots of a given funtion using the false position principle.

False Position is a closed method, meaning that when using the method you must supply two points, between which lies a root. This is a limitation of the method, however the method will always successfully find a root. 

### Possible Applications

The function is useful when solving an equation for a certain value. All other values must be known, but we can then solve for the unknown value that satisfies the equation. This is especially useful with complex equations.

Examples of experimental applications include:

1. Find pressure of a gas given its properties and the van der whals equation
2. Determining the friction between parts given an equation
3. Calculate the specific heat based on thermodynamic principles

### How Does the Function Work?

The method operates by drawing a straight line from the two guesses that bracket the root and determining a new guess based on where that line intersects the x-axis. A set equation is employed to calculate the guess at the root. After iterative applications of this equation and changing the bracketed area accordingly eventually you converge on the root of equation.

### Use of Matlab Function

Select bracketing guesses (xl,xu) such that between the guesses a root is found on the function. This .m file will approximate the root to a specified accuracy/error or number of iterations as entered by the user. Input the function you wish to find root of as '@(x) expression'
 
 Input function as:
 
 ```func = @(x) (desired function)```

The following matlab command is recommended for function use:

```[root,fx,ea,iter] = falsePosition(func, xl, xu, es, maxiter)```

where **func**, **xl**, **xu**, **es**, **maxiter** are defined as follows in the next section

#### Inputs

1. func - function to find roots of ( MUST BE ENTERED AS '@(x) function of x' )
2. xl - lower guess, used as bracket
3. xu - upper guess
4. es - desired relative percent error of estimation (defaults to 0.0001%)
5. maxiter - maximum iteration (defaults to 200)

#### Outputs

1. root - approximated root of the function
2. fx - evaluated function at root
3. ea - approximated relative percent error of root
4. iter - number of iterations program used

### Algorithm Limitations/Future Improvements

For some reason, my script does not work if the function desired is input using symbolic variables. I designed it to work with either anonymous functions (using @(x) syntax) or symbolic, however it will ONLY work with anonymous.






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
