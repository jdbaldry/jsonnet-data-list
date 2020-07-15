local l = import '../main.libsonnet';

local tests = [
  {
    name: 'equal length',
    input: [[1, 2, 3], [4, 5, 6]],
    want: [[1, 4], [2, 5], [3, 6]],
  },
  {
    name: 'missing rows',
    input: [[10, 11], [20], [], [30, 31, 32]],
    want: [[10, 20, 30], [11, 31], [32]],
  },
];
std.foldl(function(acc, tc) (
            local got = l.transpose(tc.input);
            assert tc.want == got : '%s; want: %s, got: %s' % [tc.name, tc.want, got];
            acc && true
          ),
          tests,
          true)
