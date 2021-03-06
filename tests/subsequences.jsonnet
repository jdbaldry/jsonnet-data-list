local l = import '../main.libsonnet';

local tests = [
  {
    name: 'empty array',
    input: [],
    want: [],
  },
  {
    name: 'abc',
    input: ['a', 'b', 'c'],
    want: [['a'], ['b'], ['a', 'b'], ['c'], ['a', 'c'], ['b', 'c'], ['a', 'b', 'c']],
  },
];

std.foldr(function(tc, acc) (
  local got = l.nonEmptySubsequences(tc.input);
  assert tc.want == got : '%s; want: %s, got %s' % [tc.name, tc.want, got];
  true
), tests, true)
