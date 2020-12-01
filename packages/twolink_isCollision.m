%function [flagTheta]=twolink_isCollision(theta,points)
%For each specified configuration, returns  true if  any of the links of the
%manipulator collides with  any of the points, and  false otherwise. Use the
%function polygon_isCollision to check if each link of the manipulator is in
%collision.
function [flagTheta]=twolink_isCollision(theta,points)
nbTheta=size(theta,2);
flagTheta=false(1,nbTheta);
for iTheta=1:nbTheta
    [~,vertices1Transf,vertices2Transf]=twolink_kinematicMap(theta(:,iTheta));
    flagPoints1=polygon_isCollision(vertices1Transf,points);
    flagPoints2=polygon_isCollision(vertices2Transf,points);
    flagTheta(iTheta)=any([flagPoints1 flagPoints2]);
end

%For this question,  do not consider self-collision (i.e., if the two polygons
%overlap but they do not cover any of the points, then it is not a collision).
