function [ Y ] = expressionsub(X, a1, b1, c1, d1, e1, f1, g1, h1, i1, j1, x1, y1, u1)
% This function takes in a set of values and substitutes them into the
% expression.

% At the moment this is a dudd fuction.

%% The function that does not work.
Y = subs(X, ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'x', 'y', 'u'], [a1, b1, c1, d1, e1, f1, g1, h1, i1, j1, x1, y1, u1]);

%% May want to return to this so I saved it.

% subs(X, 'c', c1);
% subs(X, 'd', d1);
% subs(X, 'e', e1);
% subs(X, 'f', f1);
% subs(X, 'g', g1);
% subs(X, 'h', h1);
% subs(X, 'i', i1);
% subs(X, 'j', j1);
% 
% subs(X, 'x', x1);
% subs(X, 'y', y1);
% 
% Y = subs(X, 'u', u1);