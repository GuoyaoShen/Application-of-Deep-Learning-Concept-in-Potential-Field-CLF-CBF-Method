%function [dPointsSphere]=sphere_distance(sphere,points)
%Computes the signed distance between points and the sphere, while taking into
%account whether the sphere is hollow or filled in.
function [dPointsSphere]=sphere_distance(sphere,points)
%geometrical radius
radius=abs(sphere.radius);
%filled-in or hollow
radiusSign=sign(sphere.radius);

if radiusSign>0  % filled
    dPointsSphere = sqrt(sum((points - sphere.xCenter).^2,1)) - radius;
else  % hollow
    dPointsSphere = radius - sqrt(sum((points - sphere.xCenter).^2,1));
end

end

%Remember that the radius of the sphere is negative for hollow spheres.
