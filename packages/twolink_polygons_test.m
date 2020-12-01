function twolink_polygons_test()
close all
[vertices1,vertices2]=twolink_polygons();
figure(1)
polygon_plot(vertices1,'r')
figure(2)
polygon_plot(vertices2,'r')
