clear all;
close all;
load('sphereworld.mat');
sphere = world(3);

points = [0,0;0,-4];
[dPointsSphere]=sphere_distance(sphere,points)