local l = import '../main.libsonnet';

local tests = [
  {
    name: 'one element',
    input: ['a'],
    want: ['a'],
  },
  {
    name: 'many elements',
    input: [3, 2, 1],
    want: [3, 2],
  },
];
std.foldl(function(acc, tc) (
            local got = l.init(tc.input);
            assert tc.want == got : '%s; want: %s, got: %s' % [tc.name, tc.want, got];
            acc && true
          ),
          tests,
          true)
