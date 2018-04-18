function [I] = Simpson(x,y)
%
%SIMPSON 1/3 RULE FUNCTION: Function uses simpsons 1/3 rule and trapezoidal rule to
%approximate an integral given data points. Program does not integrate a
%function of (x) but rather experimental data. The trapezoidal rule is used
%only when the number of sections between data points is odd and therefore
%cannot be computed only with simpsons rule
%
% INPUTS:  x - independent variable of data, usually but not always the
%              x-axis or abscissa
%          y - dependent variable of data, usually but not always the y-axis
%              or ordinate ( these depend on the what is being
%             integrated/summed in data/experiment )
% OUTPUTS: I - the evaluated integral, the sumation/accumulation of the
%              data. units will be based on the data being used.

if length(x) ~= length(y) % check if length of input vectors match
    error('x and y must be same length')
end
if sum(diff(diff(x))) ~= 0  % check if the spacing is equal for the x vector... by taking diff(diff) we check if the difference between each point varies from one to another
    error('x data must be equally spaced to use simpsons rule')
end
if mod(length(x),2) == 1 % if the # of data points is odd this means segment # is even and simpsons 1/3 rule can be used for entire calculation
    i = 2:2:(length(x)-1); % determine i vector as every other value
    j = 3:2:(length(x)-1); % j is opposite i 
    I = ((x(length(x)) - x(1)) * ( y(1)+ (4 * sum(y(i))) + (2 * sum(y(j))) + y(length(x)) )) / (3 * (length(x)-1)); % use formula for simpsons 1/3 rule compute I
else % if # segments is odd the trapezoidal rule must be used on the last segment
    warning('trapezoidal rule is used on last interval')
    i = 2:2:(length(x)-2); % determine i as we did before, but excluding last term
    j = 3:2:(length(x)-2); % j is opposite i and excludes last term as well
    Isimpsons = (((x(length(x)-1)) - x(1)) * ( y(1)+ (4 * sum(y(i))) + (2 * sum(y(j))) + y((length(x)-1)) )) / (3 * (length(x)-2)); % calculate simpsons rule portion of integral
    Itrapezoidal = ((y(length(x)-1) + y(length(x))) * (x(length(x)) - x(length(x)-1))) / 2; % calculate trapezoid part of integral
    I = Isimpsons + Itrapezoidal; % sum the two parts to find overall integral
end

