# LU Factorization Function

L U decomposition is a numerical technique for solving and determining the properties of a matrix. This is most commonly used for systems of equations but can be used for solving other matrices as needed.

This function takes an input of a matrix **A** and breaks it up into two matrices **L** and **U** which are a lower and upper diagonal matrix respecitively. When these matrices are multiplied (**L x U**) the result is matrix A.

### Possible Applications

As mentioned before, this is used to solve systems of equations or to compute the inverese matrix of the original matrix.

Examples of experimental applications include:

1. Find concentrations of liquids in connected mixing tanks
2. Steady state balances for example forces on a structure
3. Response of an added force or concentration ( a load ) to a system based on inverse matrix

### How Does the Function Work?

The script utilizes partial pivoting to automate the factoring process. First the script checks if the leading coefficient of each column is less than the first row leading coefficient. If not, the pivot matrix is used to pivot the matrix accordingly. Next, the program eliminates the appropriate rows/columns to create the upper diagonal matrix. This process is repeated, including the pivoting part. The coefficients used for elimination are stored in the lower matrix. At the end of the process you have determined a pivot matrix and the L and U matrices.

### Use of Matlab Function

This function uses the process of LU decomposition with partial pivoting 
to factor a matrix as inputted by the user. Given a 
matrix, this function will return the lower diagonal and upper diagonal 
matrices and pivot matrix cooresponding to the matrix.

The following matlab command is recommended for function use:

```[L,U,P] = luFactor(A)```

where **L**, **U**, **A** are defined as follows in the next section

#### Inputs

1. A - matrix that will be decomposed

#### Outputs

1. L - Lower diagonal matrix including the coeffecients used to eliminate and produce U matrix
2. U - Upper diagonal matrix including the values of the matrix once it is reduced through guass elimination
3. P - This matrix indentifies which rows where pivoted in the process of decomposition

### Algorithm Limitations/Future Improvements

The largest limitation of this algorithm is the fact that it only works with a 3 x 3 matrix. Because of the way the code is written it will only work for a 3 x 3 and will throw an error if you try it with a larger matrix. In the future I would like to change the code to work with any size of matrix. 

This script is useful, but the size issue is a huge limitation on it. By fixing this problem the code would be much more versatile. 

A modification of this script would solve for the inverse matrix.
