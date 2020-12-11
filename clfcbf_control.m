%function [uOpt]=clfcbf_control(xEval,world,potential)
%Compute $u^*$ according to    @  (  eq:clfcbf-qp \@@italiccorr ), where $m$ is
%given by the variable @boxIvory2 potential.repulsiveWeight
function [uOpt]=clfcbf_control(xEval,world,potential,mode)
global num_step

% get grad UAttr
gradUAttr = potential_attractiveGrad(xEval,potential);
gradUAttr = gradUAttr';
% % get grad distance
% num_obs = size(world,2);
% grad_dist = zeros(num_obs,2);
% dist = zeros(num_obs,1);
% for idx_obs=1:num_obs
%     grad_dist(idx_obs,:)=(sphere_distanceGrad(world(idx_obs),xEval))';
%     dist(idx_obs) = sphere_distance(world(idx_obs),xEval);
% end


switch lower(mode)
    case 'normal'  % traditional clf-cbf
        % get grad distance
        num_obs = size(world,2);
        grad_dist = zeros(num_obs,2);
        dist = zeros(num_obs,1);
        for idx_obs=1:num_obs
            grad_dist(idx_obs,:)=(sphere_distanceGrad(world(idx_obs),xEval))';
            dist(idx_obs) = sphere_distance(world(idx_obs),xEval);
        end
        
        ABarrier = -grad_dist;
        bBarrier = -dist;
        
    case 'avg'  % this won't work
        % get grad distance
        num_obs = size(world,2);
        grad_dist = zeros(num_obs,2);
        dist = zeros(num_obs,1);
        for idx_obs=1:num_obs
            grad_dist(idx_obs,:)=(sphere_distanceGrad(world(idx_obs),xEval))';
            dist(idx_obs) = sphere_distance(world(idx_obs),xEval);
        end
        h = (1/num_obs)*sum(dist);
        h_nabla = (1/num_obs)*sum(grad_dist,1);
        ABarrier = -h_nabla;
        bBarrier = -h;
        
    case 'relu'  % traditional geometric mean
        % get grad distance
        num_obs = size(world,2);
        grad_dist = zeros(num_obs,2);
        dist = zeros(num_obs,1);
        for idx_obs=1:num_obs
            grad_dist(idx_obs,:)=(sphere_distanceGrad(world(idx_obs),xEval))';
            dist(idx_obs) = sphere_distance(world(idx_obs),xEval);
        end
        dist_relu = max(dist,ones(num_obs,1)*(1e-7));  %[n,1]

        h_orig = exp((1/num_obs)*sum(log(dist_relu)));
        h_nabla_orig = h_orig*(1/num_obs)*((1./dist_relu)'*grad_dist);
        
        ABarrier = -h_nabla_orig;
        bBarrier = -h_orig;

    case 'relu_weight'  % general geometric mean
        % get grad distance
        num_obs = size(world,2);
        grad_dist = zeros(num_obs,2);
        dist = zeros(num_obs,1);
        for idx_obs=1:num_obs
            grad_dist(idx_obs,:)=(sphere_distanceGrad(world(idx_obs),xEval))';
            dist(idx_obs) = sphere_distance(world(idx_obs),xEval);
        end
        dist_relu = max(dist,ones(num_obs,1)*(1e-7));  %[n,1]
%         weights = ones(num_obs,1)*1;  % initiate weights
        weights = [3;3;3];  % initiate weights
        
        h = exp((1/1)*sum((1./weights).*log(weights.*dist_relu)));
        h_nabla = h*(1/1)*(((1./weights).*(1./dist_relu))'*grad_dist);
        
        ABarrier = -h_nabla;
        bBarrier = -h;
        
    otherwise
        error(['Mode not valid! (use normal as default)'])
end


% solve the cvx problem
AAttr = gradUAttr;
bAttr = potential_attractive(xEval,potential);

mPenalty = potential.repulsiveWeight;  % repulsive weight as m penalty
[uOpt,~] = qp_minEffortFix(AAttr,bAttr,ABarrier,bBarrier,mPenalty);


num_step = num_step+1;

end

%This function should use qp_minEffortFix from Question~ q:minEffortFix, by
%building $A_ attr$, $b_ attr$ according to $ $ in    @  (  eq:CLF \@@italiccorr
%), $A_ barrier$, $b_ barrier$ according to $ $ in    @  (  eq:CBF \@@italiccorr
%).
