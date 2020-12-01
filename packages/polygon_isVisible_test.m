%function polygon_isVisible_test()
%This function should perform the following operations: enumerate  an array 
%testPoints with dimensions [ 2 $ $  5] containing points generated uniformly at
%random using rand and scaled to approximately occupy the rectangle $[0,5]
%[-2,2]$ (i.e., the $x$ coordinates of the points should fall between $0$ and
%$5$, while the $y$ coordinates between $-2$ and $2$).  the coordinates 
%vertices1 and  vertices2 of two polygons from twolink_polygons.  two  logical
%vectors  flag1 and  flag2 by calling polygon_isVisible using  testPoints and,
%respectively,  vertices1 and  vertices2 as argument. item:test-polygon For each
%polygon  vertices1,  vertices2, display a separate figure using the following:
%enumerate  the array  testPointsWithPolygon by concatenating  testPoints with
%the coordinates of the polygon (i.e., the coordinates of the polygon become also
%test points).  the polygon (use polygon_plot). item:test-visibility For each
%vertex $v$ in the polygon: enumerate  the visibility of each point in 
%testPointsWithPolygon with respect to that polygon (using polygon_isVisible). 
%lines from the vertex $v$ to each point in  testPointsPolygon according in green
%if the corresponding point is visible, and in red otherwise. enumerate enumerate
% the order of the vertices in  vertices1,  vertices2 using the function fliplr. 
%item item:test-polygon above with the reversed edges. enumerate

function polygon_isVisible_test()
testPoints=rand(2,5);
testPoints=[testPoints(1,:)*5;testPoints(2,:)*4-2];
[vertices1,vertices2]=twolink_polygons();
vertices3=fliplr(vertices1);
vertices4=fliplr(vertices2);

testPointsWithPolygon=[testPoints,vertices1];

figure(1)
hold on
polygon_plot(vertices1,'b')
for indexVertex = 1:size(vertices1,2)
flagPoints=polygon_isVisible(vertices1,indexVertex,testPointsWithPolygon);
plotLinesFlag(testPointsWithPolygon,vertices1(:,indexVertex),flagPoints);
end

testPointsWithPolygon=[testPoints,vertices2];
figure(2)
hold on
polygon_plot(vertices2,'b')
for indexVertex = 1:size(vertices2,2)
flagPoints=polygon_isVisible(vertices2,indexVertex,testPointsWithPolygon);
plotLinesFlag(testPointsWithPolygon,vertices2(:,indexVertex),flagPoints);
end

testPointsWithPolygon=[testPoints,vertices3];
figure(3)
hold on
polygon_plot(vertices3,'b')
for indexVertex = 1:size(vertices3,2)
flagPoints=polygon_isVisible(vertices3,indexVertex,testPointsWithPolygon);
plotLinesFlag(testPointsWithPolygon,vertices3(:,indexVertex),flagPoints);
end

testPointsWithPolygon=[testPoints,vertices4];
figure(4)
hold on
polygon_plot(vertices4,'b')
for indexVertex = 1:size(vertices4,2)
flagPoints=polygon_isVisible(vertices4,indexVertex,testPointsWithPolygon);
plotLinesFlag(testPointsWithPolygon,vertices4(:,indexVertex),flagPoints);
end










%The function should display four separate figures in total, each one with a
%single polygon and lines from each vertex in the polygon, to each point.
