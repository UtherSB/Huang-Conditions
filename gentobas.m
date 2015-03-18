function bas = gentobas( gen )
% This function takes a generating set of matrices and returns a basis set
% of matrices. Using Hall bases may be much quicker but using D'Alessandro
% technique for now.

bas = gen;                                              % Initialise the first basis set.
finished = 0;                                           % Initialise finished.
depthset = gen;                                         % Initialise the first depth set.
dims = size(gen{1});                                    % Vector of dimensions.
dim = dims(1,1)/2;                                      % Dimension of the matrices over 2. i.e. n.

while finished == 0                                     % Loop to fill basis set.
    k = 1;                                              % Counter to fill depthset array.
    progress = numel(bas);                              % Progress tracks that the while loop is still doing something.
    for i = 1:numel(gen)                                % Double loop to fill the new depth set.
        for j = 1:numel(depthset)                       % (The gen goes first so in general this is fine. For the first time there is a lot of redundancy. For later times I would like to include Jacobi.
            depthset{k} = commutator(gen{i},depthset{j});
            k = k+1;                                    % The counter allows us to add elements to depthset. Depthset is new emptied each time.
        end
    end
 
    for i = 1:numel(depthset)                           % Linear independence check to see if we would like to add it.
        bastemp = [bas depthset{i}];
        if linindep(bastemp) == 1
            bas = [bas depthset{i}];
        end
    end
    
    if numel(bas) - progress == 0
        finished = 1;
    end
    
    
    if numel(bas) > dim*(2*dim + 1)                     % !!!!!!!!!!!!Optional error block. Error break in case we are getting a monumental algebra that is larger than it should be. This bit of code is specific to the symplectic group.
        msg = 'An error occurred: the algebra is getting too large.';
        error(msg);
    end
end