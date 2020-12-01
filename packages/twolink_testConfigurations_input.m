function twolink_testConfigurations_input()
close all
fileName='twolink_testConfigurations_noCollision';
load('twolink_testData.mat','obstaclePoints')

thetaTest=[];
subplot(1,2,1)
axis([0 2*pi 0 2*pi])
title('Click on the left of the axes to exit')
x=Inf;
while x>0
    subplot(1,2,1)
    [x,y,button]=ginput(1);
    disp([x y button])
    switch button
        case 1
            thetaTest=[thetaTest [x;y]];
        case 3
            thetaTest(:,end)=[];
    end
    subplot(1,2,2)
    twolink_plotCollision(thetaTest,obstaclePoints)
    pause(0.1)
end
thetaTest(:,end)=[];
subplot(1,2,2)
twolink_plotCollision(thetaTest,obstaclePoints)
disp(thetaTest)
disp(['Saving to ' fileName])
save(fileName,'thetaTest')
