import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _numberController = TextEditingController();
  List<int> primeNumbers = [];

  List<int> sieveOfEratosthenes(int top) {
    List<bool> boolNumbers = List.generate(top + 1, (index) => true);
    List<int> finalNumbers = [];
    boolNumbers[0] = false;
    boolNumbers[1] = false;

    for (int i = 2; i * i < top; i++) {
      if (boolNumbers[i]) {
        for (int ii = i * i; ii < top; ii += i) {
          boolNumbers[ii] = false;
        }
      }
    }

    for (int i = 2; i < top; i++) {
      if (boolNumbers[i]) {
        finalNumbers.add(i);
      }
    }
    return finalNumbers;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("sito eratostenesa"),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextField(
                          controller: _numberController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter a number',
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: IconButton.filled(
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          icon: Icon(Icons.calculate),
                          onPressed: () {
                            primeNumbers = sieveOfEratosthenes(int.parse(_numberController.text));
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  if (_numberController.text != '')
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "wszystkie liczby pierwsze do ${int.parse(_numberController.text)}:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          primeNumbers.toString(),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
