import 'package:flutter/material.dart';
import 'package:my_first_app/gradient_container.dart';

void main() {
  runApp(
   const  MaterialApp(
      home: Scaffold(
        body: GradientContainer(
            Color.fromARGB(255, 103, 49, 190),
            Color.fromARGB(255, 170, 81, 190),
            Color.fromARGB(255, 190, 110, 170),
          ),
      ),
    ),
  );
}

