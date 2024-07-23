
import 'package:flutter/material.dart';
import 'package:quiz_app1/data/questions.dart';
import 'package:quiz_app1/questions_summary.dart';
import 'package:flutter/widgets.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.choosenAnswers,
    required this.resetQuiz,
  });

  final List<String> choosenAnswers;
  final VoidCallback resetQuiz;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];

    for(var i = 0; i < choosenAnswers.length; i++ ){
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i],
    });

    }

    return summary;

  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getSummaryData();
    final numberOfTotalQuestions = questions.length;
    final numberOfCorrectAnswer = summarydata.where((data){
      return data['user_answer'] == data ['correct_answer'];
    }).length;



    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answerd $numberOfCorrectAnswer out of $numberOfTotalQuestions questions",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              ),
            const SizedBox(height: 30,
            ),

            QuestionsSummary(summaryData: summarydata),
            const SizedBox(height: 30,
            ),
            ElevatedButton.icon(
              onPressed: (){
                resetQuiz();
              }, 
              icon: const Icon(Icons.restart_alt),
              label: const Text("Restart Quiz"),
              ),
        
        ],
        ),
      ),
    );
  }
}