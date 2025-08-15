# MIMO state-feedback

A code to compute the state-feedback gain matrix for controllable state-space SISO/MIMO systems. Moore's method is an excellent choice for this task compared to other techniques, such as Ackermann's formula, as it avoids heavy symbolic computation and offers greater numerical stability for larger systems.

Consider the example given

$$\\begin{aligned} \\dot{x}(t)\&= Ax(t) +Bu(t)\\
y(t)\&= Cx(t)\\end{aligned}$$

where

$$A = \\begin{bmatrix}
1 \&  0 \& -2 \\
0 \& -1 \&  0 \\
0 \& -3 \&  3 \\
\\end{bmatrix},$$

$$B = \\begin{bmatrix}
0 \& 1 \\
1 \& 0 \\
2 \& 0 \\
\\end{bmatrix}$$

and

$$C = \\begin{bmatrix}
1 \& 0 \& 0 \\
\\end{bmatrix}.$$

For a particular entry vector

$$w = \\begin{bmatrix} 1 \& 1 \\ \\end{bmatrix}^T$$

the following gain is obtained:

$$\\begin{aligned}
K \&= WV^{-1}\\
\&= \\begin{bmatrix}
10 \&  10 \&  0 \\
0 \& -11 \& -11 \\
\\end{bmatrix}
\\end{aligned}$$

