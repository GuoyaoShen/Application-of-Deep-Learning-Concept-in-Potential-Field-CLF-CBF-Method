%function torus_twolink()
%For each one of the curves used in Question  q:torusDrawChartsTangents, do the
%following: itemize  torus_pushCurve to compute the array  thetaPoints for the
%curve;  twolink_plot to plot the two-link manipulator in each one of the
%configurations given by the columns of  thetaPoints. itemize The function should
%produce a total of four windows (or, alternatively, a single window with four
%subplots), each window (or subplot) showing all the configurations of the
%manipulator superimposed on each other.
function torus_twolink()
figure(1)

hold on
btheta=[-1;-1];

subplot(2,2,1);
single_plot([3/4*pi;0],btheta)

subplot(2,2,2);
single_plot([3/4*pi;3/4*pi],btheta)

subplot(2,2,3);
single_plot([-3/4*pi;3/4*pi],btheta)

subplot(2,2,4);
single_plot([0;-3/4*pi],btheta)

function single_plot(atheta,btheta)
NPoints=10;
for iPoints=1:NPoints
theta=line_linspace(atheta,btheta,0,1,NPoints);
twolink_plot(theta(:,iPoints),'r','thetaDot',atheta);
axis(10*[-1 1 -1 1])
axis equal
hold on
pause(0.1)
end
hold off
