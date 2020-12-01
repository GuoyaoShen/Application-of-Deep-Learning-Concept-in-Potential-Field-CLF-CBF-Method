function twolink_activityPlot()
twolink_plot([0;0],'b')
axis equal
axis([-10 10 -10 10])
savefigure('/Users/tron/BU/Teaching/ME570-MotionPlanning/Activities/figures/two-link-zero','epsc',[4 4])

twolink_plot([pi/4;pi/2],'b')
axis equal
%axis([-10 10 -10 10])
savefigure('/Users/tron/BU/Teaching/ME570-MotionPlanning/Activities/figures/two-link-example','epsc',[4 3])


