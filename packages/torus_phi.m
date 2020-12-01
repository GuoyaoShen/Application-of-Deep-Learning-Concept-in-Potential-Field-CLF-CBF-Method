%function [x]=torus_phi(theta)
%Implements equation    @  (  eq:chartTorus \@@italiccorr ).
function [x]=torus_phi(theta)
x=zeros(3,size(theta,2));
rcir=3;
for itheta=1:size(theta,2)
x(:,itheta)=blkdiag(rot2d(theta(2,itheta)),1)*([1 0 0;0 0 1]'*rot2d(theta(1,itheta))*[1;0]+[rcir 0 0]');
end
