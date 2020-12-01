%function [xTangentAtZero]=torus_phiPushCurveTangent(a,b)
%Compute $dot05Fx(0)$, the tangent to the curve $x(t)$ (as defined for the
%function torus_phiPushCurve) computed at $t=0$.
function [xTangentAtZero]=torus_phiPushCurveTangent(a,b)
ttt=0;
theta=a*ttt+b;
xTangentAtZero=torus_phiJacobian(theta)*a;

%In order to solve this question, you need to combine what you have derived in
%Questions  q:line-tangent and  q:Jacobian-explain, using torus_phiJacobian to
%compute the necessary Jacobian matrix.
