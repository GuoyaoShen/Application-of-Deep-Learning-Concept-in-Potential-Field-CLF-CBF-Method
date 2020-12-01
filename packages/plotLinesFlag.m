%function plotLinesFlag(pointsStart,pointsEnd,flags)
%Plot lines going from  pointsStart to  pointsEnd with a color that depends on 
%flags. Each element in  flag corresponds to a column in  pointsStart and one in 
%pointsEnd (i.e., to the endpoints of a line). If an element in  flag is  true,
%the corresponding line should be plotted in red, while if it is  false, it
%should be plotted in green.
function plotLinesFlag(pointsStart,pointsEnd,flags)
if size(pointsStart,2)<size(pointsEnd,2)
    pointsStart=ones(1,size(pointsEnd,2)).*pointsStart(:,1);
end
if  size(pointsStart,2)>size(pointsEnd,2)
    pointsEnd=ones(1,size(pointsStart,2)).*pointsEnd(:,1);
end
    for iPoint=1:size(pointsStart,2)
        if flags(iPoint)==0
            flag='g';
        else
            flag='r';
        end
            hold on
            coord=[pointsStart(:,iPoint),pointsEnd(:,iPoint)]';
            plot(coord(:,1),coord(:,2),flag);
            
%            plot(pointsStart(1,i),pointsStart(2,i),'*');

%            plot(pointsEnd(1,i),pointsEnd(2,i),'*');
    end

