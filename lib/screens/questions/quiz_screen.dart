import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/next_btn.dart';
import '../../widgets/question_widget.dart';
import '../../widgets/result_card.dart';
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
        backgroundColor: Colors.blue, // Thay đổi màu sắc nếu cần
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            if (questions.isNotEmpty)
              for (int i = 0; i < questions.length; i++)
                Column(
                  children: [
                    QuestionWidget(
                      question: questions[i].title,
                      indexAction: i,
                      totalQuestions: questions.length,
                    ),
                    const Divider(color: Colors.grey),
                    const SizedBox(height: 25.0),
                    for (int j = 0; j < questions[i].options.length; j++)
                      GestureDetector(
                        onTap: () {
                          // Xử lý khi người dùng chọn một tùy chọn
                        },
                        child: ResultCard(
                          result: questions[i].options[j],
                          color: Colors.blue, // Thay đổi màu sắc nếu cần
                        ),
                      ),
                  ],
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
