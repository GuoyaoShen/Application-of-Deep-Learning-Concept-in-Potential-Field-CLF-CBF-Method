%function [gradUTheta]=twolink_potential_totalGrad(thetaEval,world,potential)
%Compute the gradient of the potential $U$ pulled back through the kinematic map
%of the two-link manipulator, i.e., $ _vec17E  U(  Wp_ eff(vec17E ))$.
function [gradUTheta]=twolink_potential_totalGrad(thetaEval,world,potential)
% get Jacobian matrix
Jtheta = twolink_jacobianMatrix(thetaEval);

% get P_w (end effector position in workspace)
theta1 = thetaEval(1);
theta2 = thetaEval(2);
P_w = [cos(theta1)*(5*cos(theta2) + 5) - 5*sin(theta1)*sin(theta2);
       5*cos(theta1)*sin(theta2) + sin(theta1)*(5*cos(theta2) + 5)];
   
% get gradient U of x
gradU = potential_totalGrad(P_w,world,potential);

% gradient of "pullboack of U"
gradUTheta = Jtheta' * gradU;
% gradUTheta = (gradU' * Jtheta)';

end
