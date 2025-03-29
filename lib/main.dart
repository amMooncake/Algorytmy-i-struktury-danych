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
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
          body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              width: 100,
              child: TextField(
                controller: ,
                decoration: InputDecoration(
                  
                  labelText: 'a',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
