%function [uOpt]=clfcbf_control(xEval,world,potential)
%Compute $u^*$ according to    @  (  eq:clfcbf-qp \@@italiccorr ), where $m$ is
%given by the variable @boxIvory2 potential.repulsiveWeight
function [uOpt]=clfcbf_control(xEval,world,potential)

% get grad UAttr
gradUAttr = potential_attractiveGrad(xEval,potential);
gradUAttr = gradUAttr';
% get grad distance
num_obs = size(world,2);
grad_dist = zeros(num_obs,2);
dist = zeros(num_obs,1);
for idx_obs=1:num_obs
    grad_dist(idx_obs,:)=(sphere_distanceGrad(world(idx_obs),xEval))';
    dist(idx_obs) = sphere_distance(world(idx_obs),xEval);
end

% solve the cvx problem
AAttr = gradUAttr;
bAttr = potential_attractive(xEval,potential);
ABarrier = -grad_dist;
bBarrier = -dist;
mPenalty = potential.repulsiveWeight;  % repulsive weight as m penalty
[uOpt,~] = qp_minEffortFix(AAttr,bAttr,ABarrier,bBarrier,mPenalty);


end

%This function should use qp_minEffortFix from Question~ q:minEffortFix, by
%building $A_ attr$, $b_ attr$ according to $ $ in    @  (  eq:CLF \@@italiccorr
%), $A_ barrier$, $b_ barrier$ according to $ $ in    @  (  eq:CBF \@@italiccorr
%).
