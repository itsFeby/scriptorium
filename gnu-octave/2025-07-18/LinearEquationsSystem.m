% This file is for GNU Octave

%{

Sistem Persamaan Linear

Problem:
x + y + z = 6;
2x - y + 3z = 14;
-3x + 4y + 2z = -2;

tentukan nilai x, y, dan z

%}

%Solution:

A = [1, 1, 1; 2, -1, 3; -3, 4, 2];
B = [6; 14; -2];

x = A\B
