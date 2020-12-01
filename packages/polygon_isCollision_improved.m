%function [flagPoints]=polygon_isCollision(vertices,testPoints)
%Checks whether the a point is in collsion with a polygon (that is, inside for a
%filled in polygon, and outside for a hollow polygon).

%testPoints is a 2xN matrix.
%vertices is a 2xN matrix
function [flagPoints]=polygon_isCollision_improved(vertices,testPoints)
flagPointsarray=~polygon_isVisible_improved(vertices,testPoints);
flagPoints=~sum(flagPointsarray,1);
