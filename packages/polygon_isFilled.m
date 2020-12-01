%function [flag]=polygon_isFilled(vertices)
%Checks the ordering of the vertices, and returns whether the polygon is filled
%in or not.
function [flag]=polygon_isFilled(vertices)

v_temp=[vertices,vertices(:,1)];
arrows=zeros(2,size(vertices,2));
c=zeros(1,size(vertices,2));
z=zeros(1,size(vertices,2));
for iVert = 1:size(vertices,2)
    arrows(:,iVert)=v_temp(:,iVert+1)-v_temp(:,iVert);
end
arrows_temp=[arrows,arrows(:,1)];
for iVert = 1:size(arrows,2)
c(iVert)=acos(dot(arrows_temp(:,iVert),arrows_temp(:,iVert+1))/norm(arrows_temp(:,iVert))/norm(arrows_temp(:,iVert+1)));
z(iVert)=(arrows_temp(1,iVert)*arrows_temp(2,iVert+1)-arrows_temp(2,iVert)*arrows_temp(1,iVert+1));
end
ang=c.*sign(z);
if sum(ang)>=0
    flag=1;
else
    flag=0;
end
