%function [UAttr]=potential_attractive(xEval,potential)
%Evaluate the attractive potential $ U_ attr$ at a point  xEval with respect to a
%goal location  potential.xGoal given by the formula: If  potential.shape is equal
%to  'conic', use $p=1$. If  potential.shape is equal to  'quadratic', use $p=2$.
function [UAttr]=potential_attractive(xEval,potential)
switch lower(potential.shape)
    case 'conic'
        pval=1;
    case 'quadratic'
        pval=2;
    otherwise
        error('Attractive potential shape not recognized')
end
UAttr=norm(xEval-potential.xGoal)^pval;
