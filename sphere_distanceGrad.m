%function [gradDPointsSphere]=sphere_distanceGrad(sphere,points)
%Computes the gradient of the signed distance between points and the sphere,
%consistently with the definition of sphere_distance.
function [gradDPointsSphere]=sphere_distanceGrad(sphere,points)
%filled-in or hollow
radiusSign=sign(sphere.radius);

% get norm vector
vec_norm = (points - sphere.xCenter) ./ sqrt(sum((points - sphere.xCenter).^2,1));

if radiusSign>0  % case filled
    gradDPointsSphere = vec_norm;
else  % case hollow
    gradDPointsSphere = -vec_norm;
end

gradDPointsSphere(isnan(gradDPointsSphere))=0;  % when at circle center, grad is 0

end
