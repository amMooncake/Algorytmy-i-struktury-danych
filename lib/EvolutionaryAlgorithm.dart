import 'dart:math';

class EvolutionaryAlgorithm {
  final int populationSize = 100;
  final int generations = 100;
  final double mutationRate = 0.001;
  final double crossoverRate = 0.001;
  final double elitismRate = 0.001;
  final Random random = Random();

  List<Map<String, double>> population = [];

  EvolutionaryAlgorithm() {
    for (int i = 0; i < populationSize; i++) {
      population.add({'x': random.nextDouble() * 2 * pi, 'y': random.nextDouble() * 2 * pi});
    }
  }

  double fitness(double x, double y) {
    return sin(x) + sin(2 * x) + sin(4 * x) + sin(8 * x) + cos(y) + cos(2 * y) + cos(4 * y) + cos(8 * y);
  }

  Map<String, double> tournamentSelection() {
    int tournamentSize = 5;
    List<Map<String, double>> tournament = [];
    for (int i = 0; i < tournamentSize; i++) {
      tournament.add(population[random.nextInt(populationSize)]);
    }
    tournament.sort((a, b) => fitness(b['x']!, b['y']!).compareTo(fitness(a['x']!, a['y']!)));
    return tournament.first;
  }

  Map<String, double> uniformCrossover(Map<String, double> parent1, Map<String, double> parent2) {
    return {
      'x': random.nextBool() ? parent1['x']! : parent2['x']!,
      'y': random.nextBool() ? parent1['y']! : parent2['y']!,
    };
  }

  Map<String, double> mutate(Map<String, double> individual) {
    if (random.nextDouble() < mutationRate) {
      individual['x'] = random.nextDouble() * 2 * pi;
    }
    if (random.nextDouble() < mutationRate) {
      individual['y'] = random.nextDouble() * 2 * pi;
    }
    return individual;
  }

  Map<String, double> run() {
    for (int generation = 0; generation < generations; generation++) {
      population.sort((a, b) => fitness(b['x']!, b['y']!).compareTo(fitness(a['x']!, a['y']!)));

      int elitismCount = (elitismRate * populationSize).toInt();
      List<Map<String, double>> newPopulation = population.sublist(0, elitismCount);

      while (newPopulation.length < populationSize) {
        Map<String, double> parent1 = tournamentSelection();
        Map<String, double> parent2 = tournamentSelection();
        Map<String, double> child = uniformCrossover(parent1, parent2);
        child = mutate(child);
        newPopulation.add(child);
      }
      population = newPopulation;
    }
    population.sort((a, b) => fitness(b['x']!, b['y']!).compareTo(fitness(a['x']!, a['y']!)));
    return population.first;
  }
}

void main() {
  EvolutionaryAlgorithm ea = EvolutionaryAlgorithm();
  Map<String, double> bestSolution = ea.run();
  double bestFitness = ea.fitness(bestSolution['x']!, bestSolution['y']!);

  print('Najlepsze rozwiązanie: x = ${bestSolution['x']}, y = ${bestSolution['y']}');
  print('Maximum funkcji: $bestFitness');
}
