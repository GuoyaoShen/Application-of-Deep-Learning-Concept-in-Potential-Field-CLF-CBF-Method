%function [xPath,UPath]=potential_planner(xStart,world,potential,plannerParameters)
%This function uses a given control field (@boxIvory2 plannerParameters.control)
%to implement a generic potential-based planner with step size @boxIvory2
%plannerParameters.epsilon, and evaluates the cost along the returned path. The
%planner must stop when either the number of steps given by @boxIvory2
%plannerParameters.NSteps is reached, or when the norm of the vector given by
%@boxIvory2 plannerParameters.control is less than $10^-3$ (equivalently,
%@boxIvory2 1e-3).
function [xPath,UPath]=potential_planner(xStart,world,potential,plannerParameters)

% initialization
U_handle = plannerParameters.U;
control = plannerParameters.control;  % control, i.e. the grad
epsilon = plannerParameters.epsilon;
NSteps = plannerParameters.NSteps;

step = 1;
TOL = 1e-3;  % tolerance for control
xPath = zeros(2,NSteps);
UPath = zeros(1,NSteps);

xPath(:,1) = xStart;
UPath(1) = U_handle(xStart,world,potential);
controlCurrent = control(xPath(:,step), world, potential);

% iteration calculation
while (step<NSteps) && (norm(controlCurrent)>TOL)
    xPath(:,step+1) = xPath(:,step) + epsilon * controlCurrent;
    UPath(:,step+1) = U_handle(xPath(:,step+1), world, potential);
    
    step = step+1;
    controlCurrent = control(xPath(:,step), world, potential);
end

% if early stop, pass in NaN
if step < NSteps
   xPath(:,step:NSteps) = NaN;
   UPath(step:NSteps) = NaN;
end

end
