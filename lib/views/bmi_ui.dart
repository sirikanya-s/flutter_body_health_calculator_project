import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: const Color.fromARGB(255, 209, 241, 188),
      body: SingleChildScrollView (
        child: Center(
          child: Column(
          children: [
            
          ],
        ),
        ),
      ),
    );
  }
}