function yesno = ideal( A , B )
% This function checks if A is an ideal in B.

% Initialise addcom.

yesno = 1;

for i = 1:numel(A)
    for j = 1:numel(B)
        com = commutator(A{i},B{j});
        addcom = [B com];
        if linindep(addcom) == 1       % Linear independence check
            yesno = 0;                  % Consider displaying some text here.
            break
        end
    end
end