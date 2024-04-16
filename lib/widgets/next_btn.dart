import 'package:flutter/material.dart';
import '../constants.dart';

class NextBtn extends StatelessWidget {
  const NextBtn({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: unanswered,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: const Text(
        'Câu hỏi tiếp theo',
        textAlign: TextAlign.center,
      ),
    );
  }
}