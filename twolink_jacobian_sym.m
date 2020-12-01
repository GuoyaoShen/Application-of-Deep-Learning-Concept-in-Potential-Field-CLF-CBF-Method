% This script is used for computing the expression of end effector in worls
% frame

syms theta1 theta2;

R_w_b1 = rot2d(theta1);
R_b1_b2 = rot2d(theta2);
T_b1_b2 = [5;0];
P_b2 = [5;0];

P_w = R_w_b1*(R_b1_b2*P_b2+T_b1_b2)

J = jacobian(P_w, [theta1;theta2])