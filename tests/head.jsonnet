local l = import '../main.libsonnet';

local tests = [
  {
    name: 'one element array',
    input: ['a'],
    want: 'a',
  },
  {
    name: 'three element array',
    input: [3, 2, 1],
    want: 3,
  },
];
std.foldl(function(acc, tc) (
  local got = l.head(tc.input);
  assert tc.want == got : '%s; want: %s, got: %s' % [tc.name, tc.want, got];
  acc && true
), tests, true)
