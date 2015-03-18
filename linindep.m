function yesno = linindep( A )
% I want a function that tests the linear independence of a set of
% matrices.

elems = numel(A{1});                        % The number of elements in the matrices.
Amat = zeros(elems, numel(A));

for i = 1:numel(A)
    Amat(:,i) = reshape(A{i}',elems, 1);
end

if rank(Amat) == numel(A)
    yesno = 1;
else
    yesno = 0;
end
