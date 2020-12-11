% clc
clear all;
close all;
% load('sphereworld1.mat');
PATH_WORLD = 'sphereworld3.mat';
load(PATH_WORLD);
global num_step
num_step = 1;
% comment out the part when don't use!!!

%% potential field with potimizers
potential.repulsiveWeight = 10;  % "alpha" in the instruction
potential.shape = 'quadratic';
% potential.shape = 'conic';

plannerParameters.U = @ potential_total;
plannerParameters.control = @(x,w,p) potential_totalGrad(x,w,p);
% plannerParameters.epsilon = 1.0e-2;
plannerParameters.epsilon = 1e-1;
plannerParameters.NSteps = 4000;

tic
% potential_planner_runPlot(potential,plannerParameters,PATH_WORLD)
% potential_planner_runPlot(potential,plannerParameters,PATH_WORLD,'optimizer','momentum')
% potential_planner_runPlot(potential,plannerParameters,PATH_WORLD,'optimizer','nag')
potential_planner_runPlot(potential,plannerParameters,PATH_WORLD,'optimizer','adam')
toc



%% clf-cbf
% potential.repulsiveWeight = 10;  % "alpha" in the instruction, tune this
% plannerParameters.epsilon = 0.11;  % tune this
% %------------------------------------------
% potential.shape = 'quadratic';  % fixed
% 
% plannerParameters.U = @ potential_total;
% plannerParameters.control = @(x,w,p) -clfcbf_control(x,w,p,'relu');
% plannerParameters.NSteps = 100;  % fixed
% 
% tic
% potential_planner_runPlot(potential,plannerParameters,PATH_WORLD)
% toc
% % potential_planner_runPlot(potential,plannerParameters,PATH_WORLD,'optimizer','momentum')