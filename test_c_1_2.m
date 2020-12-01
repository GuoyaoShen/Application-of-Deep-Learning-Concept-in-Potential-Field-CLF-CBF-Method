clear all;
close all;
load('sphereworld.mat');
sphere = world(1);

points = [0,0,0;0,1,-4];

[dPointsSphere]=sphere_distance(sphere,points)
[gradDPointsSphere]=sphere_distanceGrad(sphere,points)