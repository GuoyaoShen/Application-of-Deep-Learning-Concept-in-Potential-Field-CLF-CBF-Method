clear all;
close all;
% load('sphereworld.mat');

% potential.xGoal = [7.25;0];
% potential.xGoal = [-5;-5];  % No use here, already loaded
potential.repulsiveWeight = 0.2;  % Variable, "alpha" in the instruction
potential.shape = 'quadratic';

% plannerParameters.U = @ potential_total;
% plannerParameters.control = @(x,w,p) -potential_totalGrad(x,w,p);
plannerParameters.epsilon = 0.001;  % Variable
plannerParameters.NSteps = 400;

twolink_planner_runPlot(potential,plannerParameters)


% 0.2, 0.0013
% 0.2, 0.001
% 1, 0.001