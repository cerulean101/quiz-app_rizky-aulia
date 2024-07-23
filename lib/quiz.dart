import 'package:flutter/material.dart';
import 'package:quiz_app1/data/questions.dart';
import 'package:quiz_app1/questions_screen.dart';
import 'package:quiz_app1/results_screen.dart';
import 'package:quiz_app1/start_screen.dart';
import 'package:flutter/widgets.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];


  void switchScreen(){
    setState(() {
      activeScreen = 'questions-screen';
    });
  }


  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){

      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void resetQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });

  }

  @override
  Widget build(BuildContext context) {
    
    Widget screenWidget = StartScreen(switchScreen);
    
    if(activeScreen == 'questions-screen') {
    screenWidget = QuestionsScreen(
      onSelectAnswer: chooseAnswer,
      );
  }

  if(activeScreen == 'result-screen') {
    screenWidget = ResultsScreen(
      choosenAnswers: selectedAnswers,
      resetQuiz: resetQuiz,
    );
  }
  

    return MaterialApp(
      home: Scaffold(
        body: 
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blueAccent,
                  Colors.greenAccent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ), 
              child: screenWidget,
            ),
        ),
    );
  }



}