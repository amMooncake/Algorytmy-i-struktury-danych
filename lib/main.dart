import 'package:flutter/material.dart';
import 'package:flutter_main/my_matrices.dart';
import 'package:gap/gap.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double cellHeight = 100;
  int matrixWidth = 0;
  List<List<double>> myValues = [];
  double determinant = 0;

  void onChangedTextField(value) {
    List<double> parsedValues = [];
    matrixWidth = 0;
    value.trim().replaceAll(' ', '');
    for (String part in value.split(',')) {
      try {
        double number = double.parse(part);
        parsedValues.add(number);
      } catch (e) {
        print('Invalid input: $part. Skipping.');
      }
    }

    while (matrixWidth * matrixWidth <= parsedValues.length) {
      matrixWidth++;
    }
    matrixWidth--;

    myValues = List.generate(matrixWidth, (index) {
      return List.generate(matrixWidth, (i) {
        return parsedValues[index * matrixWidth + i];
      });
    });

    determinant = MyMatrices.calculateDeterminant(myValues);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                Text('Wyznaczynik macierzy', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Gap(10),
                SizedBox(
                  width: myValues.isEmpty ? 200 : myValues.length * (cellHeight + 3),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Podaj wartości macierzy',
                    ),
                    onChanged: (value) {
                      onChangedTextField(value);
                    },
                  ),
                ),
                Gap(50),
                ...List.generate(
                  myValues.length,
                  (index) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...List.generate(
                        myValues[index].length,
                        (i) => Container(
                          width: matrixWidth < 6 ? cellHeight : (matrixWidth < 11 ? cellHeight / 2 : cellHeight / 4),
                          height: matrixWidth < 6 ? cellHeight : (matrixWidth < 11 ? cellHeight / 2 : cellHeight / 4),
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Theme.of(context).colorScheme.primary.withAlpha(100),
                          ),
                          child: Center(
                            child: Text(
                              myValues[index][i].toString(),
                              style: TextStyle(
                                fontSize: matrixWidth < 6 ? 30 : (matrixWidth < 11 ? 17 : 10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text('Wyznacznik: $determinant', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
