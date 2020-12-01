%function torus_plotCharts()
%For each one of the chart domains $U_i$ from the previous question: enumerate  a
% grid structure with fields  xx and  yy that define a grid of regular point in
%$U_i$. Use  NGrid=33.  the function grid_eval with argument  grid and torus_phi.
% the surface described by the values in  grid.F using the Matlab function surf.
%enumerate
function torus_plotCharts()
NGrid=33;
grid=struct('xx',linspace(0*pi,2*pi,NGrid),'yy',linspace(0*pi,2*pi,NGrid));
fun=@(x) torus_phi(x);
grid=grid_eval(grid,fun);
surfpic=surf(grid.F(:,:,1),grid.F(:,:,2),grid.F(:,:,3));
set(surfpic,'FaceColor','c','FaceAlpha',0.3)
axis equal;
hold on

NGrid=33;
grid=struct('xx',linspace(-0.125*pi,0.125*pi,NGrid),'yy',linspace(0,2*pi,NGrid));
fun=@(x) torus_phi(x);
grid=grid_eval(grid,fun);
surfpic2=surf(grid.F(:,:,1),grid.F(:,:,2),grid.F(:,:,3));
set(surfpic2,'FaceColor','r','EdgeColor','none')

NGrid=33;
grid=struct('xx',linspace(0,2*pi,NGrid),'yy',linspace(-0.0625*pi,0.0625*pi,NGrid));
fun=@(x) torus_phi(x);
grid=grid_eval(grid,fun);
surfpic3=surf(grid.F(:,:,1),grid.F(:,:,2),grid.F(:,:,3));
set(surfpic3,'FaceColor','b','EdgeColor','none')

NGrid=33;
grid=struct('xx',linspace(-0.25*pi,0.25*pi,NGrid),'yy',linspace(-0.125*pi,0.125*pi,NGrid));
fun=@(x) torus_phi(x);
grid=grid_eval(grid,fun);
surfpic4=surf(grid.F(:,:,1),grid.F(:,:,2),grid.F(:,:,3));
set(surfpic4,'FaceColor','g','EdgeColor','none')

%Use the commands  hold on and  hold off to show all the charts on the same
%figure. To better show the overlap between the charts, you can use different
