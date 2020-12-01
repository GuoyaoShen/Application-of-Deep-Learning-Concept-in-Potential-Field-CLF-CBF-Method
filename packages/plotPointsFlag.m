%function plotPointsFlag(points,flags)
%Plot  points with a color that depends on  flags. Each element in  flag
%corresponds to a column in  points (i.e., to a point). If an element in  flag is
% true, the corresponding point should be plotted in red, while if it is  false,
%it should be plotted in green.
function plotPointsFlag(points,flags)
for iPoint = 1:size(points,2)
    hold on
    if flags(iPoint)
        plot(points(1,iPoint),points(2,iPoint),'r*');
    else
        plot(points(1,iPoint),points(2,iPoint),'g*');
    end
    hold off
end
