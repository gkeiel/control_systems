function [ K, lamb_T ] = output_feedback_solver( A, B, C )

n = size(A,1);
m = size(B,2);  
p = size(C,1);

% declare variable matrices
W     = sdpvar(n,n,'symmetric');
M     = sdpvar(m,p,'full');              
N     = sdpvar(p,p,'full');              

% declare LMIs
LMI = W>0;
LMI = [LMI, (A*W +W*A' +B*N*C +C'*N'*B' )<0];
LMI = [LMI, M*C==C*W];

% solver settings 
options                   = sdpsettings('solver','lmilab','verbose',2);
options.lmilab.maxiter    = 100;
options.lmilab.feasradius = 1e5;
% solve feasibility problem
solvesdp(LMI,[],options);
K      = value(N)*value(M)^-1;
lamb_T = eig( A+B*K*C );

% C. A. R. Crusius and A. Trofino, "Sufficient LMI conditions for output feedback control problems," in IEEE Transactions on Automatic Control, vol. 44, no. 5, pp. 1053-1057, May 1999, doi: 10.1109/9.763227.
% *J. Lofberg, "YALMIP : a toolbox for modeling and optimization in MATLAB," 2004 IEEE International Conference on Robotics and Automation (IEEE Cat. No.04CH37508), New Orleans, LA, 2004, pp. 284-289, doi: 10.1109/CACSD.2004.1393890.