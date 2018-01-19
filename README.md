[![MATLAB FEX](https://img.shields.io/badge/MATLAB%20FEX-findduplicates-blue.svg)](https://mathworks.com/matlabcentral/fileexchange/57532-findduplicates) ![R2014b support](https://img.shields.io/badge/supports-R2014b%20and%20up-brightgreen.svg)

# `findduplicates`, find linear indices of duplicates in input

This function accepts the same input arguments as the [`unique`](http://mathworks.com/help/matlab/ref/unique.html) function, which is the basis for this function. `findduplicates` has two output arguments, `i1` and `i2`.

## Syntax

```MATLAB
[i1, i2] = findduplicates(A)
[i1, i2] = findduplicates(A, setOrder)
[i1, i2] = findduplicates(A, occurence)
[i1, i2] = findduplicates(A, _, 'rows')
[i1, i2] = findduplicates(A, 'rows', _)
[i1, i2, C, ia, ic] = findduplicates(_)

[i1, i2, C, ia, ic] = findduplicates(A, 'legacy')
[i1, i2, C, ia, ic] = findduplicates(A, 'rows', 'legacy')
[i1, i2, C, ia, ic] = findduplicates(A, occurrence, 'legacy')
[i1, i2, C, ia, ic] = findduplicates(A, 'rows', occurrence, 'legacy')
[i1, i2, C, ia, ic] = findduplicates(A, occurrence, 'rows', 'legacy')
```

## Description

`[i1, i2] = findduplicates(A)` finds the linear indices of duplicates
in input `A`. The accepted input arguments are the same as accepted by
the `unique` function. The first output, `i1`, contains the linear indices
of the first duplicate elements into `A` that correspond to the
duplicates indexed by `i2`, the second output. `i1` may contain the same
index multiple times if an element exists more than twice in `A`. If no
duplicates exist, `i1` and `i2` are returned empty.

`[i1, i2] = findduplicates(A, setOrder)` supports the `'sorted'` (default)
or `'stable'` flags of the `unique` function, but have no effect to find
duplicates.

`[i1, i2] = findduplicates(A, occurence)` specifies which duplicate to
consider as the first, `occurence` can be `'first'` (default) or `'last'`.

`[i1, i2] = findduplicates(A, _, 'rows')` and `[i1, i2] = findduplicates(A, 'rows', _)`
treat each row of `A` as a single entity
and returns indices of duplicate rows. You must specify `A` and
optionally can specify `setOrder` or `occurence`. The `'rows'` option does
not support `cell` arrays.

`[i1, i2, C, ia, ic] = findduplicates(_)` also returns `C`, `ia` and `ic`
such that `[C, ia, ic] = unique(_)`. See the documentation for `unique`
for their meaning and use.

The syntaxes with the `'legacy'` option preserve the behaviour this
function would have on R2012b and prior releases. The `'legacy'` option
must be the last input argument. It does not support `categorical`
arrays, `datetime` arrays, `duration` arrays, tables or timetables.

## Examples

### Find the first indices of duplicates and the other duplicates' indices

```MATLAB
A = [9, 2, 9, 5]
[i1, i2] = findduplicates(A)
```

Result

```
A =
     9     2     9     5
i1 =
     1
i2 =
     3
```

This indicates that the first element in `A` has a duplicate at the
third element.

### Find the last indices of duplicate character arrays and the other duplicates' indices

```MATLAB
names = {'Charlie', 'Alice', 'Bob', 'Alice', 'Alice', 'Charlie'};
[i1, i2] = findduplicates(names, 'last')
```

Result

```
i1 =
     6
     5
     5
i2 =
     1
     2
     4
```

This indicates that the character arrays at indices 6 and 5 have
duplicates, 5 having two duplicates. The duplicate for index 6 is
at index 1, the duplicates for index 5 are at indices 2 and 4.

### More examples

Run `findduplicatesdemo` for more examples of `findduplicates` based on
the examples of the `unique` function. See the contents of
findduplicatesdemo.m for details.

## Notes

`NaN` are considered as distinct values by the `unique` function, thus
they are considered non-duplicates by `findduplicates` as well.

## Licence

GNU GPLv3
