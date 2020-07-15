local l = import '../main.libsonnet';

local tests = [{
  name: 'numbers',
  input: {
    a: [0, 0],
    b: [[1], [1], [1]],
  },
  want: [1, 0, 0, 1, 0, 0, 1],
}, {
  name: 'Lorem ipsum',
  input: {
    a: [',', ' '],
    b: [['L', 'o', 'r', 'e', 'm'], ['i', 'p', 's', 'u', 'm']],
  },
  want: ['L', 'o', 'r', 'e', 'm', ',', ' ', 'i', 'p', 's', 'u', 'm'],
}];
std.foldl(function(acc, tc) (
            local got = l.intercalate(tc.input.a, tc.input.b);
            assert tc.want == got : '%s; want: %s, got: %s' % [tc.name, tc.want, got];
            acc && true
          ),
          tests,
          true)
