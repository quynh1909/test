import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../widgets/next_btn.dart';
import '../../widgets/question_widget.dart';
import '../../widgets/result_card.dart';

import 'package:provider/provider.dart';

import 'question_manager.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    final questionManager = Provider.of<QuestionManager>(context);
    final questions = questionManager.questions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: unanswered,
      ),
      body: Container(
        decoration: backgroundDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        width: double.infinity,
        child: Column(
          children: [
            QuestionWidget(
              question: questions.isNotEmpty ? questions[0].title : '',
              indexAction: 0,
              totalQuestions: questions.length,
            ),
            const Divider(color: unanswered),
            const SizedBox(height: 25.0),
            if (questions.isNotEmpty)
              for (int i = 0; i < questions[0].options.length; i++)
                GestureDetector(
                  onTap: () {},
                  child: ResultCard(
                    result: questions[0].options[i],
                    color: unanswered,
                  ),
                ),
          ],
        ),
      ),
      floatingActionButton: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: NextBtn(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}
