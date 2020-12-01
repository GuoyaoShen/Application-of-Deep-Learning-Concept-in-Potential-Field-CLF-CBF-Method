clear all;
close all;
load('sphereworld.mat');
% comment out the part when don't use!!!

% potential.repulsiveWeight
% potential.shape
% plannerParameters.epsilon

%% Influence from repulsiveWeight
% % potential.xGoal = [7.25;0];
% % potential.xGoal = [-5;-5];  % No use here, already loaded
% potential.repulsiveWeight = 0.1;  % "alpha" in the instruction
% potential.shape = 'quadratic';
% 
% plannerParameters.U = @ potential_total;
% plannerParameters.control = @(x,w,p) -potential_totalGrad(x,w,p);
% plannerParameters.epsilon = 1e-2;
% plannerParameters.NSteps = 1000;
% 
% potential_planner_runPlot(potential,plannerParameters)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% potential.repulsiveWeight = 10;  % "alpha" in the instruction
% potential.shape = 'quadratic';
% 
% plannerParameters.U = @ potential_total;
% plannerParameters.control = @(x,w,p) -potential_totalGrad(x,w,p);
% plannerParameters.epsilon = 1e-2;
% plannerParameters.NSteps = 1000;
% 
% potential_planner_runPlot(potential,plannerParameters)

%% Influence from shape
% potential.repulsiveWeight = 0.1;  % "alpha" in the instruction
% potential.shape = 'quadratic';
% 
% plannerParameters.U = @ potential_total;
% plannerParameters.control = @(x,w,p) -potential_totalGrad(x,w,p);
% plannerParameters.epsilon = 1e-2;
% plannerParameters.NSteps = 4000;
% 
% potential_planner_runPlot(potential,plannerParameters)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
potential.repulsiveWeight = 0.1;  % "alpha" in the instruction
potential.shape = 'conic';

plannerParameters.U = @ potential_total;
plannerParameters.control = @(x,w,p) -potential_totalGrad(x,w,p);
plannerParameters.epsilon = 1e-2;
plannerParameters.NSteps = 4000;

potential_planner_runPlot(potential,plannerParameters)

%% Influence from epsilon
% potential.repulsiveWeight = 0.1;  % "alpha" in the instruction
% potential.shape = 'quadratic';
% 
% plannerParameters.U = @ potential_total;
% plannerParameters.control = @(x,w,p) -potential_totalGrad(x,w,p);
% plannerParameters.epsilon = 1e-2;
% plannerParameters.NSteps = 4000;
% 
% potential_planner_runPlot(potential,plannerParameters)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% potential.repulsiveWeight = 0.1;  % "alpha" in the instruction
% potential.shape = 'quadratic';
% 
% plannerParameters.U = @ potential_total;
% plannerParameters.control = @(x,w,p) -potential_totalGrad(x,w,p);
% plannerParameters.epsilon = 1e-1;
% plannerParameters.NSteps = 4000;
% 
% potential_planner_runPlot(potential,plannerParameters)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% potential.repulsiveWeight = 0.1;  % "alpha" in the instruction
% potential.shape = 'quadratic';
% 
% plannerParameters.U = @ potential_total;
% plannerParameters.control = @(x,w,p) -potential_totalGrad(x,w,p);
% plannerParameters.epsilon = 1e-3;
% plannerParameters.NSteps = 4000;
% 
% potential_planner_runPlot(potential,plannerParameters)
