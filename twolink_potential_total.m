%function [UTheta]=twolink_potential_total(thetaEval,world,potential)
%Compute the potential $U$ pulled back through the kinematic map of the two-link
%manipulator, i.e., $U(  Wp_ eff(vec17E ))$, where $U$ is defined as in Question 
%q:total-potential, and $  Wp_ eff( )$ is the position of the end effector in the
%world frame as a function of the joint angles $vec17E = _1\\ _2$.
function [UTheta]=twolink_potential_total(thetaEval,world,potential)
% get P_w (end effector position in workspace)
theta1 = thetaEval(1);
theta2 = thetaEval(2);
P_w = [cos(theta1)*(5*cos(theta2) + 5) - 5*sin(theta1)*sin(theta2);
       5*cos(theta1)*sin(theta2) + sin(theta1)*(5*cos(theta2) + 5)];
   
% get potential total
UTheta = potential_total(P_w,world,potential);

end
