function twolink_jacobian_test
%resetRands()
aTheta=randn(2,1);
bTheta=randn(2,1);
theta=@(t) aTheta*t+bTheta;
endEffector=@(t) twolink_kinematicMap(theta(t));
endEffectorDot=@(t) twolink_jacobian(theta(t),aTheta);

funCheckDer(endEffector,endEffectorDot)
