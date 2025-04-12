import 'dart:math';

const PI = 3.14159;

class MonteCarloSurface {
  final rand = Random();
  int numSamples;
  final double a = 0;
  final double b = 2 * PI; // width
  final double h = 4.0; // height
  int pointsUnderCurver = 0;

  MonteCarloSurface({this.numSamples = 10000000});

  double calculateSurfaceUsingMonteCarlo() {
    pointsUnderCurver = 0;
    for (int i = 0; i < numSamples; i++) {
      // random points:
      double x = a + rand.nextDouble() * (b - a);
      double y = rand.nextDouble() * h; // height

      if (y < f(x)) {
        pointsUnderCurver++;
      }
    }
    double area = (b - a) * h;
    return (area * pointsUnderCurver) / numSamples;
  }

  static double f(x) {
    return (sin(x) + sin(2 * x) + sin(4 * x) + sin(8 * x)).abs();
  }
}
