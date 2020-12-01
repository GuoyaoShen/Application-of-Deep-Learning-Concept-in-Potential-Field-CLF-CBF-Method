clear all;
close all;
load('sphereworld.mat');
% comment out the part when don't use!!!

NGrid_dense = 10;
grid_dense.xx=linspace(-11,11,NGrid_dense);
grid_dense.yy=grid_dense.xx;

% NGrid_sparse = 10;
% grid_sparse.xx=linspace(-11,11,NGrid_sparse);
% grid_sparse.yy=grid_sparse.xx;

%% repulsiveWeight "10", epsilon "0.5"
% define potential
potential.xGoal = [7.25;0];
potential.repulsiveWeight = 10;  % "alpha" in the instruction
potential.shape = 'quadratic';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1);
% fHandle=@(xInput) potential_total(xInput,world,potential);
fHandle=@(xInput) clfcbf_control(xInput,world,potential);
field_plotThreshold(fHandle,30,grid_dense);
%========================================================================

%% repulsiveWeight "1", epsilon "0.5"
% define potential
potential.xGoal = [7.25;0];
potential.repulsiveWeight = 1;  % "alpha" in the instruction
potential.shape = 'quadratic';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2);
% fHandle=@(xInput) potential_total(xInput,world,potential);
fHandle=@(xInput) clfcbf_control(xInput,world,potential);
field_plotThreshold(fHandle,30,grid_dense);
%========================================================================

%% repulsiveWeight "1", epsilon "0.8" same as (repulsiveWeight "1", epsilon "0.5")
