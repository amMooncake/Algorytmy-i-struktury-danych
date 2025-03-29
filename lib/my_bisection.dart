import 'dart:math';

class MyBiselection {
  double a, b, c, d, e, f;
  double min;
  double max;
  double epsilon;
  double move;

  MyBiselection({
    this.a = 1,
    this.b = 1,
    this.c = 1,
    this.d = 1,
    this.e = 1,
    this.f = 1,
    this.min = -100,
    this.max = 100,
    this.epsilon = 0.00001,
    this.move = 0.001,
  });

  List<double> findRoots() {
    List<double> roots = [];
    double left = min;
    double mid = 0.0;
    double leftBisection;
    double rightBisection;

    while (left < max) {
      if (!sameSign(getPolynomial(left), getPolynomial(left + move))) {
        rightBisection = left + move;
        leftBisection = left;
        mid = leftBisection + rightBisection;
        while ((rightBisection - leftBisection) > epsilon) {
          if (sameSign(getPolynomial(left), getPolynomial(mid))) {
            leftBisection = mid;
          } else {
            rightBisection = mid;
          }
          mid = (leftBisection + rightBisection) / 2;
        }
        roots.add(double.parse(mid.toStringAsFixed(epsilon.toString().length - 2)));
      }
      left = double.parse((left + move).toStringAsFixed(move.toString().length - 2));
    }
    return roots;
  }

  bool sameSign(double n1, double n2) => (n1 * n2) > 0;
  double getPolynomial(double x) => a * pow(x, 5) + b * pow(x, 4) + c * pow(x, 3) + d * pow(x, 2) + e * x + f;
  double roundTo(double value, double precision) => (value * precision).round() / precision;
}

void main() {
  MyBiselection biselection = MyBiselection(a: -1, b: 5, c: 4, d: 1, e: 7, f: -10, epsilon: 0.00001, min: -1.4809);
  List<double> roots = biselection.findRoots();
  print('Roots: $roots');
}
