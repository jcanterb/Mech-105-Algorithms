#Simpsons 1/3 Rule
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
