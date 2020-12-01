clear all;
close all;
load('sphereworld.mat');
% comment out the part when don't use!!!

NGrid_dense = 1000;
grid_dense.xx=linspace(-11,11,NGrid_dense);
grid_dense.yy=grid_dense.xx;

NGrid_sparse = 50;
grid_sparse.xx=linspace(-11,11,NGrid_sparse);
grid_sparse.yy=grid_sparse.xx;

%% shape "quadratic", Repulseweight "0.1"
% define potential
potential.xGoal = [7.25;0];
potential.repulsiveWeight = 0.1;  % "alpha" in the instruction
potential.shape = 'quadratic';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1);
fHandle=@(xInput) potential_total(xInput,world,potential);
field_plotThreshold(fHandle,30,grid_dense);

figure(2);
fHandle=@(xInput) potential_totalGrad(xInput,world,potential);
field_plotThreshold(fHandle,30,grid_sparse);
%========================================================================

%% shape "quadratic", Repulseweight "10"
% define potential
potential.xGoal = [7.25;0];
potential.repulsiveWeight = 10;  % "alpha" in the instruction
potential.shape = 'quadratic';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3);
fHandle=@(xInput) potential_total(xInput,world,potential);
field_plotThreshold(fHandle,30,grid_dense);

figure(4);
fHandle=@(xInput) potential_totalGrad(xInput,world,potential);
field_plotThreshold(fHandle,30,grid_sparse);
%========================================================================

%% shape "conic", Repulseweight "0.1"
% define potential
potential.xGoal = [7.25;0];
potential.repulsiveWeight = 0.1;  % "alpha" in the instruction
potential.shape = 'conic';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(5);
fHandle=@(xInput) potential_total(xInput,world,potential);
field_plotThreshold(fHandle,30,grid_dense);

figure(6);
fHandle=@(xInput) potential_totalGrad(xInput,world,potential);
field_plotThreshold(fHandle,30,grid_sparse);
%========================================================================
