%function [Rtheta]=rot2d(theta)
%Create a 2-D rotation matrix from the angle theta according to (1)
function [Rtheta]=rot2d(theta)
Rtheta=[cos(theta) -sin(theta); sin(theta) cos(theta)];
