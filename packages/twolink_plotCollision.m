%function twolink_plotCollision(theta,points)
%This function should: enumerate  the points specified by  points as red
%asterisks.  twolink_isCollision for determining if each configuration is a
%collision or not.  twolink_draw to draw the manipulator for all configurations,
%using a red color when the manipulator is in collision, and blue otherwise.
%enumerate
function twolink_plotCollision(theta,points)


flagCollision=twolink_isCollision(theta,points);
nbTheta=size(theta,2);
for iTheta=1:nbTheta
    if flagCollision(iTheta)
        twolink_plot(theta(:,iTheta),'r');
    else
        twolink_plot(theta(:,iTheta),'g');
    end
    hold on
end
plot(points(1,:),points(2,:),'k*');
hold off
axis equal

    
