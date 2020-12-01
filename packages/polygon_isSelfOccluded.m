%function [flagPoint]=polygon_isSelfOccluded(vertex,vertexPrev,vertexNext,point)
%Given the corner of a polygon, checks whether a given point is self-occluded or
%not by that polygon (i.e., if it is ``inside'' the corner's cone or not). Points
%on boundary (i.e., on one of the sides of the corner) are not considered
%self-occluded.  Note that to check self-occlusion from one vertex, knowing the
%two lines formed with the previous and next vertices (and their ordering) is
%sufficient.

function [flagPoint]=polygon_isSelfOccluded(vertex,vertexPrev,vertexNext,point)
flagPoint=zeros(1,size(point,2));
if prod(all(vertexPrev==vertex))||prod(all(vertexNext==vertex))
    flagPoint=NaN;
else
    for iPoint=1:size(point,2)
        if vertex==point(:,iPoint)
            flagPoint(iPoint)=0;
        else
            flagPoint(iPoint)=single(edge_angle(vertex,vertexPrev,vertexNext,'unsigned'))~=single(edge_angle(vertex,vertexPrev,point(:,iPoint),'unsigned')+edge_angle(vertex,point(:,iPoint),vertexNext,'unsigned'));
        end
    end
    
end

%Use the function edge_angle to check the angle between the segment  vertex--
%point and the segments  vertex-- vertexPrev and  vertex-- vertexNext. The
%function returns  NaN if  vertex1 or  vertex2 coincides with  vertex0.
