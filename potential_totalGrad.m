%function [gradU]=potential_totalGrad(xEval,world,potential)
%Compute the gradient of the total potential, $ U= U_ attr+  @ @ _i U_ rep,i$,
%where $ $ is given by the variable  @x   potential.repulsiveWeight
function [gradU]=potential_totalGrad(xEval,world,potential)

gradUAttr = potential_attractiveGrad(xEval,potential);

num_obstacle = size(world,2);
gradURep = zeros(2,num_obstacle);
for idx_obstacle=1:num_obstacle  % for each obstacle
    gradURep(:,idx_obstacle) = potential_repulsiveSphereGrad(xEval,world(idx_obstacle));
end
gradURep = sum(gradURep,2);

gradU = gradUAttr + potential.repulsiveWeight * gradURep;

end
