function twolink_testData_input()
fileName='twolink_testData.mat';
if exist(fileName,'file')
    load(fileName)
else
    obstaclePoints=zeros(2,0);
end
title('Click on the left of the axes to exit')
x=0;
while x>-10
    plotPoints(obstaclePoints,'*')
    hold on
    twolink_draw([0;0])
    twolink_draw(deg2rad([90;180]))
    twolink_draw(deg2rad([135;0]))
    twolink_draw(deg2rad([-90;90]))
    hold off
    axis equal
    axis([-10 10 -10 10])
    [x,y,button]=ginput(1);
    switch button
        case 1
            obstaclePoints=[obstaclePoints [x;y]];
        case 3
            obstaclePoints(:,end)=[];
    end
end
save(fileName,'obstaclePoints')

function twolink_draw(theta)
[vertices1,vertices2]=twolink_kinematicMap(theta);
plotPoints(vertices1(:,[1:end 1]),'b-')
hold on
plotPoints(vertices2(:,[1:end 1]),'b-')
