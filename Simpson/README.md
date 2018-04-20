# Simpson's 1/3 Rule Function

Simpson's 1/3 rule is one of the numerical integration methods commonly used throughout our course. This method is usually more accurate than the trapezoidal rule, but is not perfectly accurate, as it is a numerical technique. 

The simpsons 1/3 rule is derived from quadratic interpolation, essentially fitting known data points or values of a function to a quadratic equation and integrating based on the quadratic estimate. We won't go into the details of the derivation here.

## How Does the Function Work?

Simpson's 1/3 rule can only be used on data sets with an even number of intervals between points. For this reason, the code checks if this condition is met, and if not,it will use trapezoidal integration to account for the last segment(s). Besides testing for this condition, the code uses set formulas to compute an integral estimate.

## Possible Applications

This function computes an integral given expiremental data points. Therefore this algorithm can be used in any application requiring an integral when a funtion is not available (summation of data points)

Examples of experimental applications include:

1. Displacement given velocity data
2. Flux based on magnetic field
3. Work based on pressure/volume or force/distance
4. Volume flow

## Use of Matlab Function

This function uses simpsons 1/3 rule, supplimented by the trapezoidal rule to approximate an integral given **data points**. Program does not integrate a function but rather experimental data. 

The trapezoidal rule is used only when the number of sections between data points is odd and therefore the integral of the data cannot be computed only with simpsons rule.

The following matlab command is recommended:

```[I] = Simpson (x,y)```

where **x**, **y**, and **I** are defined as follows in the next section

### Inputs

1. x - independent variable of data, usually but not always the x-axis or abscissa
2. y - dependent variable of data, usually but not always the y-axis or ordinate (these depend on the what is being integrated/summed in data/experiment)

### Outputs

1. I - the estimated value of the integral, the sumation/accumulation of the data. Units will be based on the data being used.

## Algorithm Limitations/Future Improvements

The largest downfall of using Simpson's rule is there must be an odd number of data points, so the trapezoidal method must be used if this condition is not met. I would like to work to combine various numerical techniques in the future to determine the most accurate method of remedying this limitation of simpson's.

Simpson's rule is accurate enough for most purposes, however it is not as accurate as iterative methods. Simpon's rule is limited because it is not iterative. Employing iteration would be useful because it would allow for approximate error analysis.

The algorithm is great for calculations using experimental data, however does not allow for use of a function if a function is available to the user. I would like to add a function integration option within the same function. 
