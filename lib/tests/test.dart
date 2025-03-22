import 'package:test/test.dart' show expect, group, test;
import '../my_matrices.dart';

void main() {
  Map<double, List<List<double>>> matrix3x3 = {
    -12: [
      [3, -2, 1],
      [3, -1, -2],
      [3, -2, -3],
    ],
    -800: [
      [-5, 5, 5],
      [-8, 9, -3],
      [8, 5, 9],
    ],
    139: [
      [6, 5, -3],
      [-5, 4, -2],
      [1, -4, 5],
    ],
  };
  List<double> keys3x3 = matrix3x3.keys.toList();
  List<List<List<double>>> values3x3 = matrix3x3.values.toList();

  const Map<int, List<List<double>>> matrix2x2 = {
    -2: [
      [1, 2],
      [3, 4]
    ],
    14: [
      [-1, 2],
      [-3, -8]
    ]
  };
  List<int> keys2x2 = matrix2x2.keys.toList();
  List<List<List<double>>> values2x2 = matrix2x2.values.toList();

  group('3x3 tests', () {
    for (int i = 0; i < keys3x3.length; i++) {
      double mat = MyMatrices.calculateDeterminant(values3x3[i]);
      test('test $i', () {
        expect(mat, keys3x3[i]);
      });
    }
  });
  group('2x2 test ', () {
    for (int i = 0; i < keys2x2.length; i++) {
      double mat = MyMatrices.calculateDeterminant(values2x2[i]);
      test('test 2x2 $i', () {
        expect(mat, keys2x2[i]);
      });
    }
  });
  group('other', () {
    test('test 1x1', () {
      double mat = MyMatrices.calculateDeterminant([
        [8]
      ]);
      expect(mat, 8);
    });
    test('null', () {
      var mat = MyMatrices.calculateDeterminant([]);
      expect(mat, 0);
    });
  });
}
