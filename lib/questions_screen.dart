
import 'package:flutter/material.dart';
import 'package:quiz_app1/answer_button.dart';
import 'package:quiz_app1/data/questions.dart';
import 'package:flutter/widgets.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key, 
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswers) {
    widget.onSelectAnswer(selectedAnswers);
    setState(() {
      currentQuestionIndex++;
    });
  }



  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Text(
            currentQuestion.text,
            textAlign: TextAlign.center,
             style: const TextStyle(
             color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
          ),
          
          ),
          const SizedBox(height: 30),
          ...currentQuestion.getShuffledAnswers().map((answer){
            return AnswerButton(
              text: answer, 
              onTap: () {
                answerQuestion(answer);
              },
              ); 
        
          }),
          
        ],
        ),
      ),
    );
  }
}