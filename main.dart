import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(DiceRollerApp());

class DiceRollerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DiceRoller(),
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.cyan,
      ),
    );
  }
}

class DiceRoller extends StatefulWidget {
  @override
  _DiceRollerState createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int numberOfDice = 1;
  List<int> results = [1];

  void rollDice() {
    setState(() {
      results = List.generate(numberOfDice, (_) => Random().nextInt(6) + 1);
    });
  }
  int calculateTotal() { return results.fold(0, (sum, item) => sum + item); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dice Roller')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
    
          
          children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
              children: results.map((result) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/dice $result.png', width: 100, height: 100
                ),
                );
              }).toList(),
            ),
       
            DropdownButton<int>(
              value: numberOfDice,
              items: [1, 2, 3].map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  numberOfDice = newValue!;
                  results = List.generate(numberOfDice, (_) => 1);
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: rollDice,
              child: Text('Roll'),
            ),
            Text('Total: ${calculateTotal()}'),
         ]
        ),
      ),
    );
  }
}
