%function polygon_isCollision_test()
%This function is the same as polygon_isVisible_test, but instead of step 
%item:test-visibility, use the following: enumerate  whether each point in 
%testPointsWithPolygon is in collision with the polygon or not using
%polygon_isCollision.  each point in  testPointsWithPolygon in green if it is not
%in collision, and red otherwise. enumerate Moreover, increase the number of test
%points from $5$ to $100$ (i.e.,  testPoints should have dimension [ 2 $ $ 
%100]).
function polygon_isCollision_test()
testPoints=rand(2,100);
testPoints=[testPoints(1,:)*5;testPoints(2,:)*4-2];
[vertices1,vertices2]=twolink_polygons();
vertices3=fliplr(vertices1);
vertices4=fliplr(vertices2);

testPointsWithPolygon=[testPoints,vertices1];
figure(1)
hold on
polygon_plot(vertices1,'b')
flagPoints=polygon_isCollision(vertices1,testPointsWithPolygon);
plotPointsFlag(testPointsWithPolygon,flagPoints)


testPointsWithPolygon=[testPoints,vertices2];
figure(2)
hold on
polygon_plot(vertices2,'b')
flagPoints=polygon_isCollision(vertices2,testPointsWithPolygon);
plotPointsFlag(testPointsWithPolygon,flagPoints)



testPointsWithPolygon=[testPoints,vertices3];
figure(3)
hold on
polygon_plot(vertices3,'b')
flagPoints=polygon_isCollision(vertices3,testPointsWithPolygon);
plotPointsFlag(testPointsWithPolygon,flagPoints)


testPointsWithPolygon=[testPoints,vertices4];
figure(4)
hold on
polygon_plot(vertices4,'b')
flagPoints=polygon_isCollision(vertices4,testPointsWithPolygon);
plotPointsFlag(testPointsWithPolygon,flagPoints)


vertices5=rand(2,3);
vertices5=[vertices5(1,:)*5;vertices5(2,:)*4-2];
testPointsWithPolygon=[testPoints,vertices5];
figure(5)
hold on
polygon_plot(vertices5,'b')
flagPoints=polygon_isCollision(vertices5,testPointsWithPolygon);
plotPointsFlag(testPointsWithPolygon,flagPoints)



