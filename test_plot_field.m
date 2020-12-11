clear all;
close all;
load('sphereworld2.mat');
% comment out the part when don't use!!!

NGrid_dense = 200;
grid_dense.xx=linspace(-16,16,NGrid_dense);
grid_dense.yy=grid_dense.xx;

NGrid_sparse = 60;
grid_sparse.xx=linspace(-16,16,NGrid_sparse);
grid_sparse.yy=grid_sparse.xx;

%% shape "quadratic", Repulseweight "0.1"
% define potential
potential.xGoal = xGoal(:,1);
potential.repulsiveWeight = 10;  % "alpha" in the instruction
potential.shape = 'quadratic';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1);
fHandle=@(xInput) potential_total(xInput,world,potential);
field_plotThreshold(fHandle,100,grid_dense);

figure(2);
fHandle=@(xInput) potential_totalGrad(xInput,world,potential);
field_plotThreshold(fHandle,30,grid_sparse);
%========================================================================