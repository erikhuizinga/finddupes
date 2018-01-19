%FINDDUPLICATES Find linear indices of duplicates in input.
%   This function accepts the same input arguments as the unique function,
%   which is the basis for this function. FINDDUPLICATES has two output
%   arguments, i1 and i2.
%
%   Syntax
%
%   [i1, i2] = FINDDUPLICATES(A)
%   [i1, i2] = FINDDUPLICATES(A, setOrder)
%   [i1, i2] = FINDDUPLICATES(A, occurence)
%   [i1, i2] = FINDDUPLICATES(A, __, 'rows')
%   [i1, i2] = FINDDUPLICATES(A, 'rows', __)
%   [i1, i2, C, ia, ic] = FINDDUPLICATES(__)
%
%   [i1, i2, C, ia, ic] = FINDDUPLICATES(A, 'legacy')
%   [i1, i2, C, ia, ic] = FINDDUPLICATES(A, 'rows', 'legacy')
%   [i1, i2, C, ia, ic] = FINDDUPLICATES(A, occurrence, 'legacy')
%   [i1, i2, C, ia, ic] = FINDDUPLICATES(A, 'rows', occurrence, 'legacy')
%   [i1, i2, C, ia, ic] = FINDDUPLICATES(A, occurrence, 'rows', 'legacy')
%
%   Description
%
%   [i1, i2] = FINDDUPLICATES(A) finds the linear indices of duplicates
%   in input A. The accepted input arguments are the same as accepted by
%   the unique function. The first output, i1, contains the linear indices
%   of the first duplicate elements into A that correspond to the
%   duplicates indexed by i2, the second output. i1 may contain the same
%   index multiple times if an element exists more than twice in A. If no
%   duplicates exist, i1 and i2 are returned empty.
%
%   [i1, i2] = FINDDUPLICATES(A, setOrder) supports the 'sorted' (default)
%   or 'stable' flags of the unique function, but have no effect to find
%   duplicates.
%
%   [i1, i2] = FINDDUPLICATES(A, occurence) specifies which duplicate to
%   consider as the first, occurence can be 'first' (default) or 'last'.
%
%   [i1, i2] = FINDDUPLICATES(A, __, 'rows') and [i1, i2] =
%   FINDDUPLICATES(A, 'rows', __) treat each row of A as a single entity
%   and returns indices of duplicate rows. You must specify A and
%   optionally can specify setOrder or occurence. The 'rows' option does
%   not support cell arrays.
%
%   [i1, i2, C, ia, ic] = FINDDUPLICATES(__) also returns C, ia and ic
%   such that [C, ia, ic] = unique(__). See the documentation for unique
%   for their meaning and use.
%
%   The syntaxes with the 'legacy' option preserve the behaviour this
%   function would have on R2012b and prior releases. The 'legacy' option
%   must be the last input argument. It does not support categorical
%   arrays, datetime arrays, duration arrays, tables or timetables.
%
%   Examples
%
%   Find first indices of duplicates and the other duplicates' indices:
%
%   A = [9, 2, 9, 5]
%   [i1, i2] = findduplicates(A)
%
%   Result
%
%   A =
%        9     2     9     5
%
%   i1 =
%        1
%
%   i2 =
%        3
%
%   This indicates that the first element in A has a duplicate at the
%   third element.
%
%   Run findduplicatesdemo for more examples of FINDDUPLICATES based on
%   the examples of the unique function. See the contents of
%   findduplicatesdemo.m for details.
%
%   Notes
%
%    - NaN are considered as distinct values by the unique function, thus
%    they are considered non-duplicates by FINDDUPLICATES as well.
%
%   See also UNIQUE, IND2SUB, FINDDUPLICATESDEMO

%   Copyright (C) 2016 Erik Huizinga, huizinga.erik@gmail.com
%
%   This program is free software: you can redistribute it and/or modify
%   it under the terms of the GNU General Public License as published by
%   the Free Software Foundation, either version 3 of the License, or
%   any ater version.
%
%   This program is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%   GNU General Public License for more details.
%
%   You should have received a copy of the GNU General Public License
%   along with this program.  If not, see <http://www.gnu.org/licenses/>.

function [i1, i2, C, ia, ic] = findduplicates(A, varargin)
    [C, ia, ic] = unique(A, varargin{:}); % indices of unique values
    
    if istable(A)
        i = 1 : height(A);
    elseif nargin > 1
        if any(strcmpi(varargin, 'rows'))
            i = 1 : size(A, 1);
        end
    end
    if ~exist('i', 'var'), i = 1 : numel(A); end
    
    i2 = setdiff(i(:), ia); % indices of duplicates corresponding to i1
    i1 = ia(ic(i2)); % indices of duplicates found first by unique
end
