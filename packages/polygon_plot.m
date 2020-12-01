%function polygon_plot(vertices,style)
%Draws a closed polygon described by  vertices using the style (e.g., color)
%given by  style.
function polygon_plot(vertices,style)
edges=diff([vertices vertices(:,1)],[],2);
quiver(vertices(1,:),vertices(2,:),...
    edges(1,:),edges(2,:),...
    style,'AutoScale','off')
