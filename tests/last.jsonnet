local l = import '../main.libsonnet';

local tests = [
  {
    name: 'array of two strings',
    input: ['a', 'b'],
    want: 'b',
  },
  {
    name: 'array of three ints',
    input: [1, 2, 3],
    want: 3,
  },
];
std.foldl(function(acc, tc) (
  local got = l.last(tc.input);
  assert tc.want == got : '%s; want: %s, got: %s' % [tc.name, tc.want, got];
  acc && true
), tests, true)
