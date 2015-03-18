function [ ] = main( i )

% MAIN: In my main I will set up my initial matrices. Then I will write
% functions to compute the conditions of Huang's theorem.

%% Creation of the three Lie algebras.

% Creating the generator sets.
[genA, V, D] = generators(i);
genB = nodrift(genA);

% Creating the Lie algebra, denoted as they are in R.Wu2005.
A = gentobas(genA);
B = gentobas(genB);
C = leftgen(genA{1}, B);

%% The Display

% Looking at B and C.
disp('The elements of the algebra B:')
celldisp(B)
disp('The elements of the algebra C:')
celldisp(C)

% Looking at the properties of the drift field. This is an attempt to relate to PDND.
disp('The eigenvector matrix of the drift field V:')
disp(V);
disp('The eigenvalue matrix of the drift field D:')
disp(D);
disp('The drift generator:'); 
disp(genA{1});

% Testing if B is equal to C. This is because this would trivialise the ideal condition.
k = 0;
for i = 1:numel(B)
    if B{i} == C{i}
        k = k+1;
    end
end
if (k == numel(B)) && (numel(B) == numel(C))
    disp('B is equal to C')
else
    disp('B is not equal to C, I think.')    % I am unsure because my code to check is not so thorough in the negative.
end

% The two Huang conditions.
if ideal(B,C) == 1
    disp('B is an ideal of C.')
else
    disp('B is not an ideal of C.')
end
Cstring = ['The dimension of the algebra C is ', num2str(numel(C))];
disp(Cstring);
Astring = ['The dimension of the algebra A is ', num2str(numel(A))];
disp(Astring);

