import 'package:flutter/material.dart';
import '../../models/question_model.dart';
import '../../services/question_service.dart';

class AddQuestionScreen extends StatefulWidget {
  const AddQuestionScreen({Key? key}) : super(key: key);

  @override
  _AddQuestionScreenState createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController optionController1 = TextEditingController();
  final TextEditingController optionController2 = TextEditingController();
  final TextEditingController optionController3 = TextEditingController();
  final TextEditingController optionController4 = TextEditingController();

  bool optionValue1 = false;
  bool optionValue2 = false;
  bool optionValue3 = false;
  bool optionValue4 = false;

  final QuestionService questionService = QuestionService();

  String generateKey() {
    // Sinh mã key từ thời gian hiện tại
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  void submitQuestion(BuildContext context) {
    if (titleController.text.isNotEmpty &&
        optionController1.text.isNotEmpty &&
        optionController2.text.isNotEmpty &&
        optionController3.text.isNotEmpty &&
        optionController4.text.isNotEmpty) {
      // Construct the options map with option text as keys and boolean values
      Map<String, bool> options = {
        optionController1.text: optionValue1,
        optionController2.text: optionValue2,
        optionController3.text: optionValue3,
        optionController4.text: optionValue4,
      };

      // Check if at least one option is marked as the correct answer
      if (options.containsValue(true)) {
        Question question = Question(
          id: generateKey(),
          title: titleController.text,
          options: options.keys.toList(),
        );

        questionService.addQuestion(question).then((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Câu hỏi đã được thêm vào cơ sở dữ liệu'),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(vertical: 20.0),
            ),
          );
          // Reset input fields and checkboxes after adding the question
          titleController.clear();
          optionController1.clear();
          optionController2.clear();
          optionController3.clear();
          optionController4.clear();
          setState(() {
            optionValue1 = false;
            optionValue2 = false;
            optionValue3 = false;
            optionValue4 = false;
          });
        }).catchError((error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Đã xảy ra lỗi: $error'),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(vertical: 20.0),
            ),
          );
        });
      } else {
        // Show error message if no correct answer is selected
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Vui lòng chọn ít nhất một đáp án đúng'),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(vertical: 20.0),
          ),
        );
      }
    } else {
      // Show error message if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Vui lòng điền đầy đủ thông tin cho câu hỏi'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm Câu Hỏi Mới'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Nội dung câu hỏi',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: optionController1,
                decoration: InputDecoration(
                  labelText: 'Option 1',
                ),
              ),
              CheckboxListTile(
                title: Text('Đáp án đúng'),
                value: optionValue1,
                onChanged: (value) {
                  setState(() {
                    optionValue1 = value!;
                  });
                },
              ),
              TextField(
                controller: optionController2,
                decoration: InputDecoration(
                  labelText: 'Option 2',
                ),
              ),
              CheckboxListTile(
                title: Text('Đáp án đúng'),
                value: optionValue2,
                onChanged: (value) {
                  setState(() {
                    optionValue2 = value!;
                  });
                },
              ),
              TextField(
                controller: optionController3,
                decoration: InputDecoration(
                  labelText: 'Option 3',
                ),
              ),
              CheckboxListTile(
                title: Text('Đáp án đúng'),
                value: optionValue3,
                onChanged: (value) {
                  setState(() {
                    optionValue3 = value!;
                  });
                },
              ),
              TextField(
                controller: optionController4,
                decoration: InputDecoration(
                  labelText: 'Option 4',
                ),
              ),
              CheckboxListTile(
                title: Text('Đáp án đúng'),
                value: optionValue4,
                onChanged: (value) {
                  setState(() {
                    optionValue4 = value!;
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => submitQuestion(context),
                child: Text('Thêm Câu Hỏi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
