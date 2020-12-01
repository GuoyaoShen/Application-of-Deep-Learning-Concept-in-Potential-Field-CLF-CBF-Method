%function [vertexEffectorTransf,vertices1Transf,vertices2Transf]=twolink_kinematicMap(theta)
%The function returns the coordinates of all the vertices of the links
%transformed according to $ _1, _2$.
function [vertexEffectorTransf,vertices1Transf,vertices2Transf]=twolink_kinematicMap(theta)
[vertices1,vertices2]=twolink_polygons();
vertices1Transf=rot2d(theta(1))*vertices1+[0;0];
vertices2Transf=rot2d(theta(1))*(rot2d(theta(2))*vertices2+[5;0]);
vertexEffectorTransf=rot2d(theta(1))*(rot2d(theta(2))*[5;0]+[5;0]);




%Use the results from Question  q:kinematicMapDerivation to guide your
%implementation. This function must use twolink_polygons to obtain the vertices
%of the polygons of the matrix, and it must use rot2d from Question  q:rot2d.
%Note that ere we are simply computing the vertices of the transformed polygons,
%without drawing them. The next function will be used to plot the transformed
%vertices.
