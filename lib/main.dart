import 'package:flutter/material.dart';
import 'package:flutter_main/my_bisection.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<TextEditingController> controllersFunction = [
    TextEditingController(text: "1"), //a
    TextEditingController(text: "1"), //b
    TextEditingController(text: "1"), //c
    TextEditingController(text: "1"), //d
    TextEditingController(text: "1"), //e
    TextEditingController(text: "1"), //f
  ];
  final List<TextEditingController> controllersRange = [
    TextEditingController(text: "-100"), //min
    TextEditingController(text: "100"), //max
    TextEditingController(text: "0.00001"), //epsilon
    TextEditingController(text: "0.001"), //move
  ];

  List<double>? roots;
  void calculate() {
    double a = double.parse(controllersFunction[0].text);
    double b = double.parse(controllersFunction[1].text);
    double c = double.parse(controllersFunction[2].text);
    double d = double.parse(controllersFunction[3].text);
    double e = double.parse(controllersFunction[4].text);
    double f = double.parse(controllersFunction[5].text);
    double min = double.parse(controllersRange[0].text);
    double max = double.parse(controllersRange[1].text);
    double epsilon = double.parse(controllersRange[2].text);
    double move = double.parse(controllersRange[3].text);

    MyBiselection biselection = MyBiselection(
      a: a,
      b: b,
      c: c,
      d: d,
      e: e,
      f: f,
      min: min,
      max: max,
      epsilon: epsilon,
      move: move,
    );

    roots = biselection.findRoots();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...List.generate(controllersFunction.length, (index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: index == 5 ? 0 : 10),
                            width: 100,
                            child: TextField(
                              controller: controllersFunction[index],
                              decoration: InputDecoration(
                                labelText: String.fromCharCode(97 + index),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...List.generate(
                          controllersRange.length,
                          (index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: index == 3 ? 0 : 10),
                              width: 100,
                              child: TextField(
                                controller: controllersRange[index],
                                decoration: InputDecoration(
                                  labelText: ["min", "max", "epsilon", "move"][index],
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 100,
                          height: 48 + 48 + 10,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: calculate,
                            child: Text("Calculate"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                SelectableText.rich(
                  TextSpan(
                    text: roots == null ? "Tu będzie wynik" : "Miejsca zerowe: ${roots.toString()}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: roots == null ? Colors.grey : Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
