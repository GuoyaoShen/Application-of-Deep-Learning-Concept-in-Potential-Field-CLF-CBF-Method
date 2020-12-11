%function [gradURep]=potential_repulsiveSphereGrad(xEval,sphere)
%Compute the gradient of $U_ rep$ for a single sphere, as given by    @  ( 
%eq:repulsive-gradient \@@italiccorr ).
function [gradURep]=potential_repulsiveSphereGrad(xEval,sphere)
nbXEval=size(xEval,2);
dist=sphere_distance(sphere,xEval);

%Initialize returned potential with a default value
gradURep=zeros(2,nbXEval);

%Set points inside the obstacle
flagDistPositive=dist>0;
% gradURep(:,~flagDistPositive)=Inf;
gradURep(:,~flagDistPositive)=NaN;

%Set points inside the radius of influence
flagDistInfluence=dist<sphere.distInfluence;
flag_check = flagDistPositive & flagDistInfluence;

if any(flag_check)  % only calculate those need calculation
    gradURep(:,flag_check) = -(1./dist(flag_check)-1/sphere.distInfluence).* ...
        (1./(dist(flag_check).^2)).*sphere_distanceGrad(sphere,xEval(:,flag_check));
end

end

%This function must use the outputs of sphere_distanceSphere.
