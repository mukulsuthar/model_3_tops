import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorUI(),
    );
  }
}

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({super.key});

  @override
  State<CalculatorUI> createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  String display = "0";

  void onButtonClick(String value) {
    setState(() {
      if (value == "C") {
        display = "0";
      } else if (value == "=") {
        try {
          display = _calculate(display).toString();
        } catch (e) {
          display = "Error";
        }
      } else {
        if (display == "0") {
          display = value;
        } else {
          display += value;
        }
      }
    });
  }

  double _calculate(String expr) {
    // Very simple evaluator for + and -
    List<String> parts = expr.split(RegExp(r'([+\-])')).map((e) => e.trim()).toList();
    double result = double.tryParse(parts[0]) ?? 0;

    for (int i = 1; i < parts.length; i += 2) {
      String op = parts[i];
      double num = double.tryParse(parts[i + 1]) ?? 0;

      if (op == "+") {
        result += num;
      } else if (op == "-") {
        result -= num;
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Calculator"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          // Display area
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                display,
                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // Buttons grid
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 4,
            padding: const EdgeInsets.all(8),
            children: [
              "7","8","9","+",
              "4","5","6","-",
              "1","2","3","=",
              "0","C"
            ].map((btn) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => onButtonClick(btn),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.blueGrey,
                  ),
                  child: Text(
                    btn,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
