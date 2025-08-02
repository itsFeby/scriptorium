## Copyright (C) 2025 feby
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} newton-raphson (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: feby <mac@feby>
## Created: 2025-07-11
function x = newtonRaphson(f, df, x0, tol)
  x = x0;
  for i = 1:100
    delta = f(x) / df(x);
    x = x - delta;
    if abs(delta) < tol
      break;
    endif
  endfor
endfunction

% Contoh penggunaan:
f = @(x) x^2 - 2;       % Fungsi: x² - 2
df = @(x) 2*x;           % Turunannya
akar = newtonRaphson(f, df, 1.0, 1e-6);
disp(["Akar: ", num2str(akar)]);

