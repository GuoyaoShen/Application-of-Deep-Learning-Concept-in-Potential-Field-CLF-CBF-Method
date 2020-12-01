%function [flagPoints]=polygon_isVisible(vertices,indexVertex,testPoints)
%Checks whether a point $p$ is visible from a vertex $v$ of a polygon. In order
%to be visible, two conditions need to be satisfied: enumerate  point $p$ should
%not be self-occluded with respect to the vertex $v$\\ (see
%polygon_isSelfOccluded).  segment $p$--$v$ should not collide with  any of the
%edges of the polygon (see edge_isCollision). enumerate

function [flagPoints]=polygon_isVisible_improved(vertices,testPoints)


fill=polygon_isFilled(vertices);
vertices_temp=[vertices(:,size(vertices,2)),vertices,vertices(:,1)];
piso=zeros(1,size(vertices,2));
normVec=zeros(1,size(vertices,2));
atan2theta=zeros(1,size(vertices,2));
eicindex=zeros(1,size(vertices,2));
flagPoints_temp=zeros(1,size(vertices,2));
flagPoints=zeros(size(testPoints,2),size(vertices,2));
for iPoint=1:size(testPoints,2)
    for iVert=1:size(vertices,2)
        piso(iVert)=polygon_isSelfOccluded(vertices_temp(:,iVert+1),vertices_temp(:,iVert),vertices_temp(:,iVert+2),testPoints(:,iPoint));
        vectors=vertices(:,iVert)-testPoints(:,iPoint);
        normVec(iVert)=norm(vectors);
        atan2theta(iVert)=atan2(vectors(2),vectors(1));
        for indexVertex=1:size(vertices,2)
            eicindex(indexVertex)=edge_isCollision([testPoints(:,iPoint),vertices(:,iVert)],[vertices_temp(:,indexVertex+1),vertices_temp(:,indexVertex+2)],fill);
        end
        flagPoints_temp(iVert)=piso(iVert)>0||sum(eicindex)>0;
    end
    uni_theta=unique(atan2theta);
    for isize=1:size(uni_theta,2)
        position=find(atan2theta==uni_theta(isize));
        if length(position)>=2
            valid_position=position.*(flagPoints_temp(position));
            if sum(valid_position)~=0
                flagPoints_temp(position(normVec(position)>min(normVec(position(valid_position>0)))))=1;
                %flagPoints_temp(m(find(normVec(m)>min(normVec(m(find(mc~=0)))))))=1;
            end
        end
    end

    flagPoints(iPoint,:)=flagPoints_temp;
end
flagPoints=flagPoints';


%Note that, with the definitions of edge collision and self-occlusion given in
%the previous questions, a vertex should be visible from the previous and
%following vertices in the polygon.
