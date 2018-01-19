%FINDDUPLICATESDEMO
%   FINDDUPLICATESDEMO is a demonstration of findduplicates based on all
%   documentation examples of the unique function. Run each section by
%   pressing CTRL + SHIFT + ENTER (on Windows).
%
%   See also FINDDUPLICATES

%   Copyright (C) 2016 Erik Huizinga, huizinga.erik@gmail.com
%
%   This program is free software: you can redistribute it and/or modify
%   it under the terms of the GNU General Public License as published by
%   the Free Software Foundation, either version 3 of the License, or
%   any later version.
%
%   This program is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%   GNU General Public License for more details.
%
%   You should have received a copy of the GNU General Public License
%   along with this program.  If not, see <http://www.gnu.org/licenses/>.

%% unique example 1: Unique Values in Vector
clc, clear

A = [9, 2, 9, 5]
C = unique(A)
[i1, i2] = findduplicates(A)

%% unique example 2: Unique Rows in Table
clc, clear

Name = {'Fred'; 'Betty'; 'Bob'; 'George'; 'Jane'};
Age = [38; 43; 38; 40; 38];
Height = [71; 69; 64; 67; 64];
Weight = [176; 163; 131; 185; 131];

A = table(Age, Height, Weight, 'RowNames', Name)

C = unique(A)
[i1, i2] = findduplicates(A)

%% unique example 3: Unique Values and Their Indices
% N/A, because for findduplicates it is identical to example 1

%% unique example 4: Unique Rows in Matrix
clc, clear

A = randi(3, 12, 3)
[C, ia, ic] = unique(A(:, 1:2), 'rows')
[i1, i2] = findduplicates(A(:, 1:2), 'rows')

%% unique example 5: Unique Values in Vector with Specified Order
clc, clear

A = [9, 2, 9, 5]
[C, ia, ic] = unique(A, 'stable')
[i1, i2] = findduplicates(A, 'stable')

%% unique example 6: Unique Values in Array Containing NaNs
clc, clear

A = [5, 5, NaN, NaN]
C = unique(A)
[i1, i2] = findduplicates(A)

%% unique example 7: Unique Entries in Cell Array of Character Vectors
clc, clear

A = {'one', 'two', 'twenty-two', 'One', 'two'}
C = unique(A)
[i1, i2] = findduplicates(A)

%% unique example 8: Cell Array of Character Vectors with Trailing White Space
% This example is also a demo where A contains no duplicates, thus i1 and
% i2 are returned empty.
clc, clear

A = {'dog', 'cat', 'fish', 'horse', 'dog ', 'fish '}
C = unique(A)
[i1, i2] = findduplicates(A)

%% unique example 9: Preserve Legacy Behavior of unique
clc, clear

A = [9, 2, 9, 5]
[C, ia, ic] = unique(A, 'legacy')
[i1, i2] = findduplicates(A, 'legacy')
