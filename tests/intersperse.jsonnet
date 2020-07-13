local l = import '../main.libsonnet';

local tests = [{
  name: 'abc',
  input: {
    e: ',',
    a: ['a', 'b', 'c'],
  },
  want: ['a', ',', 'b', ',', 'c'],
}];
std.foldl(function(acc, tc) (
            local got = l.intersperse(tc.input.e, tc.input.a);
            assert tc.want == got : '%s; want: %s, got: %s' % [tc.name, tc.want, got];
            acc && true
          ),
          tests,
          true)
