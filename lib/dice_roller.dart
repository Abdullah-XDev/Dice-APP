import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  final int numberOfPlayers;

  const DiceRoller({Key? key, required this.numberOfPlayers}) : super(key: key);

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  late List<int> currentDiceRolls;

  @override
  void initState() {
    super.initState();
    currentDiceRolls = List.generate(widget.numberOfPlayers, (index) => 1);
  }

  void rollDice(int playerIndex) {
    setState(() {
      currentDiceRolls[playerIndex] = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.numberOfPlayers > 1)
          Padding(
            padding: const EdgeInsets.only(
                bottom: 8.0), // تعديل الـ Padding للزر العلوي
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/dice-${currentDiceRolls[0]}.png',
                  width: 200,
                ),
                Positioned(
                  top: -20, // تعديل الموقع العلوي للزر ليظهر بالكامل
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationX(pi), // عكس الزر
                    child: TextButton(
                      onPressed: () => rollDice(0),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                          fontSize: 28,
                        ),
                      ),
                      child: const Text('Roll Dice'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        for (int i = 1; i < widget.numberOfPlayers; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/dice-${currentDiceRolls[i]}.png',
                  width: 200,
                ),
                TextButton(
                  onPressed: () => rollDice(i),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.only(top: 10),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  child: const Text('Roll Dice'),
                ),
              ],
            ),
          ),
        Text(
          'Created by Eng.Abdullah',
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 37, 35, 35),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
