% This script is used for creating sphereworld map
clear all;
close all;

%% === WORLD 1 ===
% sphere1 = struct('xCenter',[0;0],'radius',-10,'distInfluence',1);
% sphere2 = struct('xCenter',[0;3],'radius',2,'distInfluence',2);
% sphere3 = struct('xCenter',[3;-3],'radius',2,'distInfluence',2);
% world = [sphere1,sphere2,sphere3];
% xStart = [-5;0];
% xGoal = [7;
%          3];
% sphereworld_plot(world, xGoal(:,1));
% save('sphereworld1.mat','world','xStart','xGoal')

%% === WORLD 2 ===
% sphere1 = struct('xCenter',[0;0],'radius',-10,'distInfluence',1);
% sphere2 = struct('xCenter',[0;3],'radius',2,'distInfluence',2);
% sphere3 = struct('xCenter',[3;3],'radius',2,'distInfluence',2);
% sphere4 = struct('xCenter',[3;-3],'radius',2,'distInfluence',2);
% sphere5 = struct('xCenter',[0;-3],'radius',2,'distInfluence',2);
% world = [sphere1,sphere2,sphere3,sphere4,sphere5];
% % xStart = [-7;0];
% xStart = [0;-0.5];
% xGoal = [7;
%          3];
% sphereworld_plot(world, xGoal(:,1));
% save('sphereworld2.mat','world','xStart','xGoal')

%% === WORLD 3 ===
sphere1 = struct('xCenter',[0;0],'radius',-15,'distInfluence',1);
sphere2 = struct('xCenter',[0;0],'radius',1,'distInfluence',1);
sphere3 = struct('xCenter',[3;3],'radius',2,'distInfluence',1);
sphere4 = struct('xCenter',[-5;3],'radius',2,'distInfluence',1);
sphere5 = struct('xCenter',[-3;-6],'radius',2,'distInfluence',1);
sphere6 = struct('xCenter',[-5;-3],'radius',1.5,'distInfluence',1);
sphere7 = struct('xCenter',[5;-4],'radius',1.5,'distInfluence',1);
sphere8 = struct('xCenter',[10;0],'radius',3,'distInfluence',1);
sphere9 = struct('xCenter',[3;-11],'radius',2,'distInfluence',1);
sphere10 = struct('xCenter',[-2;9],'radius',3,'distInfluence',1);
world = [sphere1,sphere2,sphere3,sphere4,sphere5,sphere6,sphere7,sphere8,sphere9,sphere10];
xStart = [-8;0];
% xStart = [-5;0];
xGoal = [7;
         3];
sphereworld_plot(world, xGoal(:,1));
save('sphereworld3.mat','world','xStart','xGoal')