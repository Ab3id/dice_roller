import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.from(
          colorScheme: ColorScheme.light(
              primary: Color(0xFF4DB6AC), background: Color(0xFF80CBC4))),
      home: const MyHomePage(title: 'DiceRoller'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _leftDiceNumber = Random().nextInt(6) + 1;
  int _rightDiceNumber = Random().nextInt(6) + 1;

  void _rollDice() {
    setState(() {
      _leftDiceNumber = Random().nextInt(6) + 1;
      _rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Click to roll',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => _rollDice(),
                  child: Dice(
                    background: Colors.white,
                    color: Colors.black,
                    itemCount: _leftDiceNumber,
                  ),
                ),
                InkWell(
                  onTap: () => _rollDice(),
                  child: Dice(
                    background: Colors.black,
                    color: Colors.white,
                    itemCount: _rightDiceNumber,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Dice extends StatelessWidget {
  final Color background;
  final Color color;
  final int itemCount;
  const Dice(
      {super.key,
      required this.background,
      required this.color,
      required this.itemCount});

  @override
  Widget build(BuildContext context) {
    List<Widget> dots = [];
    int num = 1;
    for (num; num <= itemCount; num++) {
      dots.add(Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: color),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 150,
          width: 150,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                direction: Axis.horizontal,
                spacing: 70.0,
                runSpacing: 25.0,
                children: [...dots],
              ),
            ],
          ),
        )
      ],
    );
  }
}
