local d = (import 'github.com/sh0rez/docsonnet/doc-util/main.libsonnet') {
  T+:: {
    array2d: 'array',
  },
};
{
  '#': d.pkg(
    name='data-list',
    url='github.com/jdbaldry/jsonnet-data-list/main.libsonnet',
    help='`data-list` provides functions that imitate the Haskell Data.List library for Jsonnet arrays',
  ),

  '#head': d.fn('Extract the first element of an array, which must be non-empty.', [d.arg('a', d.T.array)]),
  local head(a) =
    assert std.isArray(a) : 'not array: `head`';
    assert std.length(a) > 0 : 'empty array: `head`';
    a[0],
  head(a):: head(a),

  '#last': d.fn('Extract the last element of an array, which must be finite and non-empty.', [d.arg('a', d.T.array)]),
  local last(a) =
    assert std.isArray(a) : 'not array: `last`';
    assert std.length(a) > 0 : 'empty array: `last`';
    a[std.length(a) - 1],
  last(a):: last(a),

  '#tail': d.fn('Extract the elements after the head of a array, which must be non-empty.', [d.arg('a', d.T.array)]),
  local tail(a) =
    assert std.isArray(a) : 'not array: `tail`';
    assert std.length(a) > 0 : 'empty array: `tail`';
    if std.length(a) == 1 then [] else a[1:],
  tail(a):: tail(a),

  '#init': d.fn('Return all the elements of an array except the last one. The array must be non-empty.', [d.arg('a', d.T.array)]),
  local init(a) =
    assert std.isArray(a) : 'not array: `init`';
    assert std.length(a) > 0 : 'empty array: `init`';
    if std.length(a) == 1 then a else a[:std.length(a) - 1],
  init(a):: init(a),

  '#reverse': d.fn('Returns the elements of an array in reverse order. The array must be finite.', [d.arg('a', d.T.array)]),
  local reverse(a) =
    assert std.isArray(a) : 'not array: `reverse`';
    std.reverse(a),
  reverse(a):: reverse(a),

  '#intersperse': d.fn("Takes an element and an array and 'intersperses' that element between the elements of the list.", [d.arg('e', d.T.any), d.arg('a', d.T.array)]),
  local intersperse(e, a) =
    assert std.isArray(a) : 'not array: `intersperse`';
    if std.length(a) == 0 then [e]
    else
      assert std.type(e) == std.type(a[0]) : 'mismatched types: `intersperse`';
      std.foldl(function(acc, ae) acc + [e] + [ae], a[1:], [a[0]]),
  intersperse(e, a):: intersperse(e, a),

  '#intercalate': d.fn('Inserts the array `a` between the elements of the array of arrays `b` and concatenates the result.', [d.arg('a', d.T.array2d), d.arg('b', d.T.array)]),
  local intercalate(a, b) =
    assert std.isArray(a) && std.isArray(b) : 'not array: `intercalate`';
    if std.length(b) == 0 then a
    else std.flattenArrays(intersperse(a, b)),
  intercalate(a, b):: intercalate(a, b),

  '#transpose': d.fn('Transposes the rows and columns of its arguments. If some rows are shorter than the following rows, their elements are skipped.', [d.arg('a', d.T.array2d)]),
  local transpose(a) =
    assert std.isArray(a) : 'not array: `transpose`';
    if std.length(a) == 0 then []
    else if std.length(head(a)) == 0 then
      transpose(tail(a))
    else
      local x = head(head(a)),
            xs = tail(head(a)),
            xss = tail(a);
      [
        [x] + [head(xs) for xs in xss if std.length(xs) > 0],
      ]
      + transpose(
        [xs] + [tail(xs) for xs in xss if std.length(xs) > 0]
      ),
  transpose(a):: transpose(a),

  '#subsequences': d.fn('Returns an array of all subsequences of array `a`', [d.arg('a', d.T.array)]),
  local subsequences(a) = [[]] + nonEmptySubsequences(a),
  subsequences(a):: subsequences(a),

  '#nonEmptySubsequences': d.fn('Return an array of non-empty subsequences of array `a`', [d.arg('a', d.T.array)]),
  local nonEmptySubsequences(a) =
    assert std.isArray(a) : 'not array: `subsequences`';
    if std.length(a) == 0 then [] else
      local x = head(a);
      local xs = tail(a);
      local f(ys, r) = [ys] + [[x] + ys] + r;
      [[x]] + std.foldr(f, nonEmptySubsequences(xs), []),
  nonEmptySubsequences(a):: nonEmptySubsequences(a),
}
