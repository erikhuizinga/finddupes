# `findduplicates`, a MATLAB function to find linear indices of duplicates in input

This function accepts the same input arguments as the [`unique`](http://mathworks.com/help/matlab/ref/unique.html) function, which is the basis for this function. `findduplicates` has two output arguments, i1 and i2.

##Syntax
`[i1,i2] = findduplicates(A,__)` finds the linear indices of duplicates in input `A`. The accepted input arguments are the same as accepted by the `unique` function. The first output, `i1`, contains the linear indices of the first duplicate elements into `A` that correspond to the duplicates indexed by `i2`, the second output. `i1` may contain the same index multiple times if an element exists more than twice in `A`. If no duplicates exist, `i1` and `i2` are returned empty.

##Examples
Run `findduplicatesdemo` for a demonstration of `findduplicates`. See the contents of `findduplicatesdemo`.m for details.

##Notes
 - The `'stable'` flag of the `unique` function has no functionality in `findduplicates`, but is allowed for compatibility.
 - `NaN` are considered as non-unique by the `unique` function, thus they are considered non-duplicates by `findduplicates` as well.
 - For completeness the third, fourth and fifth outputs are the three ouptut of the `unique` function. Use them as follows: `[i1,i2,C,ia,ic] = findduplicates(__)`.
