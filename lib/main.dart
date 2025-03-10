import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
    home: MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Algorytm Euklidesa na NWD'),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        validator: (value) {
                          if (value != null && !isNumeric(value)) {
                            return 'Podaj liczbę';
                          }
                          if (value == null || value.isEmpty) {
                            return 'Podaj liczbę';
                          }
                          return null;
                        },
                        controller: controller1,
                        decoration: InputDecoration(
                          labelText: 'Podaj pierwszą liczbę',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        validator: (value) {
                          if (value != null && !isNumeric(value)) {
                            return 'Podaj liczbę';
                          }
                          if (value == null || value.isEmpty) {
                            return 'Podaj liczbę';
                          }
                          return null;
                        },
                        controller: controller2,
                        decoration: const InputDecoration(
                          labelText: 'Podaj drugą liczbę',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 300,
                height: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue.shade300,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      int first = int.parse(controller1.text);
                      int second = int.parse(controller2.text);
                      int gcd = calculateGCD(first, second);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Największy wspólny dzielnik z $first i $second to:'),
                                  Text(
                                    gcd.toString(),
                                    style: TextStyle(fontSize: 30),
                                  ),
                                ],
                              ),
                            );
                          });
                    }
                  },
                  child: Text(
                    "oblicz NWD",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  int calculateGCD(int a, int b) {
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
