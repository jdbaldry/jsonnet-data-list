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
  head(a)::
    assert std.isArray(a) : 'not array: `head`';
    assert std.length(a) > 0 : 'empty array: `head`';
    a[0],

  '#last': d.fn('Extract the last element of an array, which must be finite and non-empty.', [d.arg('a', d.T.array)]),
  last(a)::
    assert std.isArray(a) : 'not array: `last`';
    assert std.length(a) > 0 : 'empty array: `last`';
    a[std.length(a) - 1],

  '#tail': d.fn('Extract the elements after the head of a array, which must be non-empty.', [d.arg('a', d.T.array)]),
  tail(a)::
    assert std.isArray(a) : 'not array: `tail`';
    assert std.length(a) > 0 : 'empty array: `tail`';
    if std.length(a) == 1 then [] else a[1:],

  '#init': d.fn('Return all the elements of an array except the last one. The array must be non-empty.', [d.arg('a', d.T.array)]),
  init(a)::
    assert std.isArray(a) : 'not array: `init`';
    assert std.length(a) > 0 : 'empty array: `init`';
    if std.length(a) == 1 then a else a[:std.length(a) - 1],

  '#reverse': d.fn('Returns the elements of an array in reverse order. The array must be finite.', [d.arg('a', d.T.array)]),
  reverse(a)::
    assert std.isArray(a) : 'not array: `reverse`';
    std.reverse(a),

  '#intersperse': d.fn("Takes an element and an array and 'intersperses' that element between the elements of the list.", [d.arg('e', d.T.any), d.arg('a', d.T.array)]),
  intersperse(e, a)::
    assert std.isArray(a) : 'not array: `intersperse`';
    if std.length(a) == 0 then [e]
    else
      assert std.type(e) == std.type(a[0]) : 'mismatched types: `intersperse`';
      std.foldl(function(acc, ae) acc + [e] + [ae], a[1:], [a[0]]),

  '#intercalate': d.fn('Inserts the array `a` between the elements of the array of arrays `b` and concatenates the result.', [d.arg('a', d.T.array2d), d.arg('b', d.T.array)]),
  intercalate(a, b)::
    assert std.isArray(a) && std.isArray(b) : 'not array: `intercalate`';
    if std.length(b) == 0 then a
    else std.flattenArrays(self.intersperse(a, b)),

  '#transpose': d.fn('Transposes the rows and columns of its arguments. If some rows are shorter than the following rows, their elements are skipped.', [d.arg('a', d.T.array2d)]),
  transpose(a)::
    assert std.isArray(a) : 'not array: `transpose`';
    if std.length(a) == 0 then []
    else if std.length(self.head(a)) == 0 then
      self.transpose(self.tail(a))
    else
      local x = self.head(self.head(a)),
            xs = self.tail(self.head(a)),
            xss = self.tail(a);
      [
        [x] + [self.head(xs) for xs in xss if std.length(xs) > 0],
      ]
      + self.transpose(
        [xs] + [self.tail(xs) for xs in xss if std.length(xs) > 0]
      ),

  '#subsequences': d.fn('Returns an array of all subsequences of array `a`', [d.arg('a', d.T.array)]),
  subsequences(a):: error 'not implemented',
  //    assert std.isArray(a) : 'not array: `subsequences`';
  //    if std.length(a) == 0 then [] else
  //      local x = self.head(a);
  //      local xs = self.tail(a);
  //      local f(r, ys) = ys + [x] + r;
  //      [[x], std.foldr(f, self.subsequences(xs), [])],
}
