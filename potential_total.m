%function [U]=potential_total(xEval,world,potential)
%Compute the function $U=U_ attr+  @ @ _iU_ rep,i$, where $ $ is given by the
%variable  @x   potential.repulsiveWeight
function [UTotal]=potential_total(xEval,world,potential)

UAttr = potential_attractive(xEval,potential);

num_obstacle = size(world,2);
URep = zeros(num_obstacle,1);
for idx_obstacle=1:num_obstacle  % for each obstacle
    URep(idx_obstacle) = potential_repulsiveSphere(xEval,world(idx_obstacle));
end
URep = sum(URep);

UTotal = UAttr + potential.repulsiveWeight * URep;

end
