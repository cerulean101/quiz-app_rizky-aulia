import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Image.asset(
        'assets/images/flutter-quiz-logo.png',
        color: Colors.white,
        width: 300,
       ),
       const SizedBox(height: 80,
       ),
      const Text(
        "Learn Flutter the FUN way",
        style: TextStyle(
         color:Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
       ),
       ),
       const SizedBox(
        height: 40,
        ),

        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
        icon: const Icon(Icons.arrow_right_alt), 
        label: const Text("Start Quiz"),
        ),

        // OutlinedButton(
        //   onPressed: () {}, 
        //   style: OutlinedButton.styleFrom(
        //     foregroundColor: Colors.white,
        //   ),
        //   child: Text("Start Quiz"),
        // ),
      ],
    ),
    );
  }
}