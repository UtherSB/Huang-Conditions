function A = nodrift(B)
% This function is just a quick one to cut off the drift field from a set
% of generators.

temp = B;
temp(:,1) = [ ];
A = temp;