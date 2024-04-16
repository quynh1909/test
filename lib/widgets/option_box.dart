import 'package:flutter/material.dart';
import '../constants.dart';

class OptionBox extends StatelessWidget {
  const OptionBox({super.key, required this.option, required this.questionLength, required this.onPressed});

  final int option;
  final int questionLength;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Score', style: TextStyle(color: unanswered, fontSize: 24.0),),
          const SizedBox(height: 20.0),
          CircleAvatar(
            child: Text(
              '$option/$questionLength', 
              style: TextStyle(fontSize: 30.0),
            ),
            radius: 70.0,
            backgroundColor: option == questionLength / 2
              ? Colors.yellow
              : option < questionLength / 2
                ? incorrect
                : correct,
          ),
          const SizedBox(height: 20.0),
          Text(option == questionLength / 2
              ? 'Gần được rồi'
              : option < questionLength / 2
                ? 'Thử lại'
                : 'Làm tốt lắm',
              style: TextStyle(color: unanswered, fontSize: 15.0),
          ),
          const SizedBox(height: 30.0),
          GestureDetector(
            onTap: onPressed,
            child: const Text(
              'Bắt đầu lại',
              style: TextStyle(color: Colors.blue, fontSize: 20.0, letterSpacing: 1.0),
            ),
          )
        ],
      ),
    );
  }
}
