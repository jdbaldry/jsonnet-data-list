local l = import '../main.libsonnet';

local tests = [{
  name: 'Lorem ipsum',
  input: {
    a: [',', ' '],
    b: ['Lorem', 'ipsum', 'dolor'],
  },
  want: ['Lorem', ',', ' ', 'ipsum', ',', ' ', 'dolor'],
}];
std.foldl(function(acc, tc) (
            local got = l.intercalate(tc.input.a, tc.input.b);
            assert tc.want == got : '%s; want: %s, got: %s' % [tc.name, tc.want, got];
            acc && true
          ),
          tests,
          true)
