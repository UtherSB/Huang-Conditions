function A = leftgen( x , B )
% This function calculates a new basis of a Lie algebra by left bracketing
% by a single matrix enough times to make the new Lie algebra.

Agen = B;                                   % Initialise the first set of bases.
finished = 0;
com = B;
dims = size(x);                             % Vector of dimensions.
dim = dims(1,1)/2;                          % Dimension of the matrices over 2. i.e. n.
              
while finished == 0
    k = 0;                                  % Reset k to 0. It tells us if the while loop is doing anything.
    for i = 1:numel(com)
        com{i} = commutator(x,com{i});
        addcom = [Agen com{i}];
        if linindep(addcom) == 1
            Agen = [Agen com{i}];
            k = 1;                          % Means that we did something in that commutator round so don't stop while loop.
        end
        
        if numel(Agen) > dim*(2*dim + 1)    % !!! Optional error block. Error message to stop blow up.
            msg = 'An error occurred: the algebra C has too large a generating set.';
            error(msg);
        end 
    end
    
    if k == 0                               % k == 0 means nothing happened that loop of the while.
        finished = 1;
    end
end

if numel(Agen) == dim*(2*dim + 1)           % !!! Option error block. Stops the algorithm from trying to work out the algebra of 21 generators.
    A = Agen;
else
    A = gentobas(Agen);
end

A = gentobas(Agen);