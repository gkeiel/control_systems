clc; clear;

% declare unstable system
A = [0  0   0   0;
     0  0   0   0;
     2  0   1   2;
     0  2   2   1];
B = [1  0;
     0  1;
     0  0;
     0  0];
C = [4  -3   3  0;
    -2   2  -1  2];

lamb_A = eig(A);      % eigenvalues of A

% stabilizing output feedback gain
[ K, lamb_T ] = output_feedback_solver( A, B, C );

% print result
fprintf('open-loop eigenvalues   = [ %s] \n', sprintf('%.2f ', lamb_A));
fprintf('closed-loop eigenvalues = [ %s] \n', sprintf('%.2f ', lamb_T));
fprintf('K = \n');
fprintf('%s \n', sprintf([repmat(' %.2f ', 1, size(K,2)) '\n'], K));