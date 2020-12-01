%function [Jphi]=torus_phiJacobian(theta)
%Implements equation    @  (  eq:chartTorusJacobian \@@italiccorr ).
function [Jphi]=torus_phiJacobian(theta)
rcir=3;
Jphi=[-cos(theta(2))*sin(theta(1)) -sin(theta(2))*cos(theta(1))-rcir*sin(theta(2));-sin(theta(2))*sin(theta(1)) cos(theta(2))*cos(theta(1))+rcir*cos(theta(2));cos(theta(1)) 0];
%For this function,  do not use the symbolic toolbox! Explicitly code the results
%you obtained in Question  q:Jacobian-derivation using standard Matlab functions.
