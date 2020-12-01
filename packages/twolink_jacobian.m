%function [vertexEffectorDot]=twolink_jacobian(theta,thetaDot)
%Implement the map for the Jacobian of the position of the end effector with
%respect to the joint angles as derived in Question  q:jacobian-effector.
function [vertexEffectorDot]=twolink_jacobian(theta,thetaDot,linkLengths)
if ~exist('linkLengths','var')
    linkLengths=[5 5];
end
nbTheta=size(theta,2);
%vertexEffectorDot=zeros(2,nbTheta);
for iTheta=1:nbTheta
    vertexEffectorDot(:,iTheta)=hat2(thetaDot(1))*rot2d(theta(1))*(rot2d(theta(2))*[linkLengths(1);0]+[linkLengths(2);0])...
        +rot2d(theta(1))*hat2(thetaDot(2))*rot2d(theta(2))*[linkLengths(1);0];
end

function S=hat2(w)
S=[0 -w; w 0];

