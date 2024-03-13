import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  final int numberOfPlayers;
  

  const DiceRoller({Key? key, required this.numberOfPlayers}) : super(key: key);

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  late List<int> currentDiceRolls;

  @override
  void initState() {
    super.initState();
    currentDiceRolls = List.generate(widget.numberOfPlayers, (index) => 2);
  }

  void rollDice(int playerIndex) {
    setState(() {
      currentDiceRolls[playerIndex] = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < widget.numberOfPlayers; i++)
          Column(
            children: [
              Image.asset(
                'assets/images/dice-${currentDiceRolls[i]}.png',
                width: 200,
              ),
              TextButton(
                onPressed: () => rollDice(i),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(top: 20),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 28,
                  ),
                ),
                child: const Text('Roll Dice'),
              ),
            ],
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
