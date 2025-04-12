import 'package:flutter/material.dart';
import 'monte_carlo.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final MonteCarloSurface monteCarloSurface = MonteCarloSurface(numSamples: 50000000);
  double generated = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Monte Carlo Simulation'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Powierzchnia: $generated',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  generated = monteCarloSurface.calculateSurfaceUsingMonteCarlo();
                  setState(() {});
                },
                child: Tab(child: Text('Calculate')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
