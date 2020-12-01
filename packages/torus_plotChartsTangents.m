%function torus_plotChartsTangents()
%The function should iterate over the following four curves: itemize 
%a=[3/4*pi;0],  a=[3/4*pi;3/4*pi],  a=[-3/4*pi;3/4*pi],  a=[0;-3/4*pi], itemize
%and  b=[-1;-1]. The function should show an overlay containing: itemize  output
%of torus_drawCharts;  output of the functions torus_pushCurve and
%torus_pushCurveTangent for each one of the curves. itemize \@@par 
function torus_plotChartsTangents()
lineOpts={'LineWidth',2};
torus_drawCharts();
hold on
bthete=[-1;-1];
atheta=[3/4*pi;0];
pushCurve=torus_phiPushCurve(atheta,bthete);
plot3(pushCurve(1,:),pushCurve(2,:),pushCurve(3,:),'r',lineOpts{:});
PushCurveTangent=torus_phiPushCurveTangent(atheta,bthete);
quiver3(pushCurve(1,1),pushCurve(2,1),pushCurve(3,1),PushCurveTangent(1),PushCurveTangent(2),PushCurveTangent(3),'r',lineOpts{:});

atheta=[3/4*pi;3/4*pi];
pushCurve=torus_phiPushCurve(atheta,bthete);
plot3(pushCurve(1,:),pushCurve(2,:),pushCurve(3,:),'b',lineOpts{:});
PushCurveTangent=torus_phiPushCurveTangent(atheta,bthete);
quiver3(pushCurve(1,1),pushCurve(2,1),pushCurve(3,1),PushCurveTangent(1),PushCurveTangent(2),PushCurveTangent(3),'b',lineOpts{:});

atheta=[-3/4*pi;3/4*pi];
pushCurve=torus_phiPushCurve(atheta,bthete);
plot3(pushCurve(1,:),pushCurve(2,:),pushCurve(3,:),'y',lineOpts{:});
PushCurveTangent=torus_phiPushCurveTangent(atheta,bthete);
quiver3(pushCurve(1,1),pushCurve(2,1),pushCurve(3,1),PushCurveTangent(1),PushCurveTangent(2),PushCurveTangent(3),'y',lineOpts{:});

atheta=[0;-3/4*pi];
pushCurve=torus_phiPushCurve(atheta,bthete);
plot3(pushCurve(1,:),pushCurve(2,:),pushCurve(3,:),'g',lineOpts{:});
PushCurveTangent=torus_phiPushCurveTangent(atheta,bthete);
quiver3(pushCurve(1,1),pushCurve(2,1),pushCurve(3,1),PushCurveTangent(1),PushCurveTangent(2),PushCurveTangent(3),'g',lineOpts{:});


%This function needs to use plot3 to show the output of torus_pushCurve, and
%quiver3 to show the output of torus_pushCurveTangent. You should see that all
%the curves and tangents start at the same point on the torus, and that each
%tangent is in fact tangent to the respective curve.  @boxDodgerBlue3 white 
%optional Use different colors to display the results of the different curves.
