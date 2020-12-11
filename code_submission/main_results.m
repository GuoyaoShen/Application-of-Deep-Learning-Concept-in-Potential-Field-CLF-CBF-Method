% clc
clear all;
close all;
% comment out the part when don't use!!!


%% ================================== PART 1 ==================================
%% Some initializations
PATH_WORLD = 'sphereworld3.mat';  % use world number: 1,2,3; or use 'sphere_world_creater.m' to define a new world
load(PATH_WORLD);
global num_step
num_step = 1;

%% Potential field with potimizers
potential.repulsiveWeight = 10;  % "alpha" in the instruction
potential.shape = 'quadratic';
% potential.shape = 'conic';

plannerParameters.U = @ potential_total;
plannerParameters.control = @(x,w,p) potential_totalGrad(x,w,p);
plannerParameters.epsilon = 1.0e-2;  % lr for vanilla, momentum, nag
% plannerParameters.epsilon = 1e-1;  % lr for adam
plannerParameters.NSteps = 4000;

tic
potential_planner_runPlot(potential,plannerParameters,PATH_WORLD)  % vanilla gradient descent
% potential_planner_runPlot(potential,plannerParameters,PATH_WORLD,'optimizer','momentum')
% potential_planner_runPlot(potential,plannerParameters,PATH_WORLD,'optimizer','nag')
% potential_planner_runPlot(potential,plannerParameters,PATH_WORLD,'optimizer','adam')
toc



%% CLF-CBF
% potential.repulsiveWeight = 10;  % "alpha" in the instruction, tune this
% plannerParameters.epsilon = 0.1;  % tune this
% %------------------------------------------
% potential.shape = 'quadratic';  % fixed
% 
% plannerParameters.U = @ potential_total;
% plannerParameters.control = @(x,w,p) -clfcbf_control(x,w,p,'relu');  % use 'normal', 'relu' or 'relu_weight'
% plannerParameters.NSteps = 100;  % fixed
% 
% tic
% potential_planner_runPlot(potential,plannerParameters,PATH_WORLD)
% toc


%% ================================== PART 2 ==================================
% %% Plot "sphere_world2"
% load('sphereworld2.mat');
% % comment out the part when don't use!!!
% 
% NGrid_dense = 200;
% grid_dense.xx=linspace(-16,16,NGrid_dense);
% grid_dense.yy=grid_dense.xx;
% 
% NGrid_sparse = 60;
% grid_sparse.xx=linspace(-16,16,NGrid_sparse);
% grid_sparse.yy=grid_sparse.xx;
% 
% %% shape "quadratic", Repulseweight "0.1"
% % define potential
% potential.xGoal = xGoal(:,1);
% potential.repulsiveWeight = 10;  % "alpha" in the instruction
% potential.shape = 'quadratic';
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure(1);
% fHandle=@(xInput) potential_total(xInput,world,potential);
% field_plotThreshold(fHandle,100,grid_dense);
% 
% figure(2);
% fHandle=@(xInput) potential_totalGrad(xInput,world,potential);
% field_plotThreshold(fHandle,30,grid_sparse);
% %========================================================================