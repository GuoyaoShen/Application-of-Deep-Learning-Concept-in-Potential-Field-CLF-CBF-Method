clear all;
close all;
load('sphereworld.mat');


%%
potential.repulsiveWeight = 10;  % "alpha" in the instruction, tune this
plannerParameters.epsilon = 0.5;  % tune this
%------------------------------------------
potential.shape = 'quadratic';  % fixed

plannerParameters.U = @ potential_total;
plannerParameters.control = @(x,w,p) clfcbf_control(x,w,p);
plannerParameters.NSteps = 20;  % fixed

potential_planner_runPlot(potential,plannerParameters)

%%
% potential.repulsiveWeight = 1;  % "alpha" in the instruction, tune this
% plannerParameters.epsilon = 0.5;  % tune this
% %------------------------------------------
% potential.shape = 'quadratic';  % fixed
% 
% plannerParameters.U = @ potential_total;
% plannerParameters.control = @(x,w,p) clfcbf_control(x,w,p);
% plannerParameters.NSteps = 20;  % fixed
% 
% potential_planner_runPlot(potential,plannerParameters)

%%
% potential.repulsiveWeight = 1;  % "alpha" in the instruction, tune this
% plannerParameters.epsilon = 0.8;  % tune this
% %------------------------------------------
% potential.shape = 'quadratic';  % fixed
% 
% plannerParameters.U = @ potential_total;
% plannerParameters.control = @(x,w,p) clfcbf_control(x,w,p);
% plannerParameters.NSteps = 20;  % fixed
% 
% potential_planner_runPlot(potential,plannerParameters)