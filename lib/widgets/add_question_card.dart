import 'package:flutter/material.dart';

class AddQuestionCard extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController optionController1;
  final TextEditingController optionController2;
  final TextEditingController optionController3;
  final TextEditingController optionController4;
  final ValueChanged<String> onChangedOption1;
  final ValueChanged<String> onChangedOption2;
  final ValueChanged<String> onChangedOption3;
  final ValueChanged<String> onChangedOption4;

  const AddQuestionCard({
    Key? key,
    required this.titleController,
    required this.optionController1,
    required this.optionController2,
    required this.optionController3,
    required this.optionController4,
    required this.onChangedOption1,
    required this.onChangedOption2,
    required this.onChangedOption3,
    required this.onChangedOption4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView( // Sử dụng ListView thay vì Column
          shrinkWrap: true, // Cho phép ListView thu gọn để tiết kiệm không gian
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Question Title',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: optionController1,
              onChanged: onChangedOption1,
              decoration: InputDecoration(
                labelText: 'Option 1',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: optionController2,
              onChanged: onChangedOption2,
              decoration: InputDecoration(
                labelText: 'Option 2',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: optionController3,
              onChanged: onChangedOption3,
              decoration: InputDecoration(
                labelText: 'Option 3',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: optionController4,
              onChanged: onChangedOption4,
              decoration: InputDecoration(
                labelText: 'Option 4',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
