%function [gradUAttr]=potential_attractiveGrad(xEval,potential)
%Evaluate the gradient of the attractive potential $ U_ attr$ at a point  xEval.
%The gradient is given by the formula If  potential.shape is equal to  'conic',
%use $p=1$. If  potential.shape is equal to  'quadratic', use $p=2$.
function [gradUAttr]=potential_attractiveGrad(xEval,potential)
switch lower(potential.shape)
    case 'conic'
        pval=1;
    case 'quadratic'
        pval=2;
    otherwise
        error('Attractive potential shape not recognized')
end
gradUAttr=pval*norm(xEval-potential.xGoal)^(pval-2)*(xEval-potential.xGoal);

end
