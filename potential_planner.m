%function [xPath,UPath]=potential_planner(xStart,world,potential,plannerParameters)
%This function uses a given control field (@boxIvory2 plannerParameters.control)
%to implement a generic potential-based planner with step size @boxIvory2
%plannerParameters.epsilon, and evaluates the cost along the returned path. The
%planner must stop when either the number of steps given by @boxIvory2
%plannerParameters.NSteps is reached, or when the norm of the vector given by
%@boxIvory2 plannerParameters.control is less than $10^-3$ (equivalently,
%@boxIvory2 1e-3).
function [xPath,UPath]=potential_planner(xStart,world,potential,plannerParameters,varargin)
%% optional parameters
optimizer = 'gd';  % default to traditional gradient descent
ivarargin=1;
while ivarargin<=length(varargin)
    switch lower(varargin{ivarargin})
        case 'optimizer'
            ivarargin=ivarargin+1;
            optimizer=varargin{ivarargin};
       otherwise
            error(['Argument ' varargin{ivarargin} ' not valid!'])
    end
    ivarargin=ivarargin+1;
end


%% planner
% initialization
U_handle = plannerParameters.U;
control = plannerParameters.control;  % control, i.e. the grad
epsilon = plannerParameters.epsilon;
NSteps = plannerParameters.NSteps;

step = 1;
TOL = 1e-2;  % tolerance for control
xPath = zeros(2,NSteps);
UPath = zeros(1,NSteps);

xPath(:,1) = xStart;
UPath(1) = U_handle(xStart,world,potential);

% iteration calculation
while step<NSteps
    switch optimizer
        case 'gd'
            controlCurrent = control(xPath(:,step), world, potential);
            xPath(:,step+1) = xPath(:,step) - epsilon * controlCurrent;
            if norm(epsilon * controlCurrent)<TOL  % break if stepsize within tolerance
%                 norm(epsilon * controlCurrent)
                break;
            end
        case 'momentum'
            gamma = 0.4;
            if step==1
                v_last = 0;
            else
%                 v_last = control(xPath(:,step-1), world, potential);
                v_last = v_current;
            end
            v_current = gamma * v_last + epsilon * control(xPath(:,step), world, potential);
            xPath(:,step+1) = xPath(:,step) - v_current;
            if norm(v_current)<TOL  % break if stepsize within tolerance
                break;
            end
        case 'nag'
            gamma = 0.4;
            if step==1
                v_last = 0;
            else
%                 v_last = control(xPath(:,step-1), world, potential);
                v_last = v_current;
            end
            v_current = gamma * v_last + epsilon * control(xPath(:,step)-gamma*v_last, world, potential);
            xPath(:,step+1) = xPath(:,step) - v_current;
            if norm(v_current)<TOL  % break if stepsize within tolerance
                break;
            end
        case 'adam'
            beta1 = 0.9;
            beta2 = 0.999;
            eps = 1e-8;
            g = control(xPath(:,step), world, potential);  % the grad
            if step==1
                m = 0;
                v = 0;
            else
                m = beta1*m + (1-beta1)*g;
                v = beta2*v + (1-beta2)*(g.^2);
            end
            m_hat = m/(1-beta1^step);
            v_hat = v/(1-beta2^step);
            v_current = epsilon*m_hat./(sqrt(v_hat)+eps);
            xPath(:,step+1) = xPath(:,step) - v_current;
            if norm(v_current)<TOL && step>1  % break if stepsize within tolerance
                break;
            end
        otherwise
            error('Optimizer type not recognized')
    end
    
%     controlCurrent = control(xPath(:,step), world, potential);
%     if norm(controlCurrent)<TOL  % break if within tolerance
%         break;
%     end
%     xPath(:,step+1) = xPath(:,step) + epsilon * controlCurrent;
    UPath(:,step+1) = U_handle(xPath(:,step+1), world, potential);
    
    step = step+1;
end

% if early stop, pass in NaN
if step < NSteps
   xPath(:,step:NSteps) = NaN;
   UPath(step:NSteps) = NaN;
end

end
