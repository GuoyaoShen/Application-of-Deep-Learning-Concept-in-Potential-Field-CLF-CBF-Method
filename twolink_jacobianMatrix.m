%function [Jtheta]=twolink_jacobianMatrix(theta)
%Compute the matrix representation of the Jacobian of the position of the end
%effector with respect to the joint angles as derived in Question 
%q:jacobian-matrix.
function [Jtheta]=twolink_jacobianMatrix(theta)
theta1 = theta(1);
theta2 = theta(2);

Jtheta = [ - 5*cos(theta1)*sin(theta2) - sin(theta1)*(5*cos(theta2) + 5), - 5*cos(theta1)*sin(theta2) - 5*cos(theta2)*sin(theta1);
    cos(theta1)*(5*cos(theta2) + 5) - 5*sin(theta1)*sin(theta2),   5*cos(theta1)*cos(theta2) - 5*sin(theta1)*sin(theta2)];

end
