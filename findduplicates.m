function [i1,i2,C,ia,ic] = findduplicates(A,varargin)
%FINDDUPLICATES Find linear indices of duplicates in input.
%   This function accepts the same input arguments as the unique function,
%   which is the basis for this function. FINDDUPLICATES has two output
%   arguments, i1 and i2.
%
%   Syntax
%   [i1,i2] = FINDDUPLICATES(A,__) finds the linear indices of duplicates
%   in input A. The accepted input arguments are the same as accepted by
%   the unique function. The first output, i1, contains the linear indices
%   of the first duplicate elements into A that correspond to the
%   duplicates indexed by i2, the second output. i1 may contain the same
%   index multiple times if an element exists more than twice in A. If no
%   duplicates exist, i1 and i2 are returned empty.
%
%   Examples
%   Run findduplicatesdemo for a demonstration of FINDDUPLICATES. See the
%   contents of findduplicatesdemo.m for details.
%
%   Notes
%    - The 'stable' flag of the unique function has no functionality in
%    FINDDUPLICATES, but is allowed for compatibility.
%    - NaN are considered as non-unique by the unique function, thus they
%    are considered non-duplicates by FINDDUPLICATES as well.
%    - For completeness the third, fourth and fifth outputs are the three
%    output arguments of the unique function: [i1,i2,C,ia,ic] =
%    FINDDUPLICATES(__).
%
%   See also UNIQUE, IND2SUB, FINDDUPLICATESDEMO

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

[C,ia,ic] = unique(A,varargin{:}); % indices of unique values
if istable(A)
    i = 1:height(A);
elseif nargin>1
    if any(strcmpi(varargin{:},'rows'))
        i = 1:size(A,1);
    end
end
if ~exist('i','var'), i = 1:numel(A); end
i2 = setdiff(i(:),ia); % indices of duplicates corresponding to i1
i1 = ia(ic(i2)); % indices of duplicates found first by unique
