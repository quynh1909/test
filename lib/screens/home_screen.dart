import 'package:flutter/material.dart';
import 'screens.dart';
import 'shared/app_drawer.dart';
import '../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
        backgroundColor: unanswered,
      ),
      drawer: const AppDrawer(),
      body: Container(
        decoration: backgroundDecoration,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuizScreen()));
            },
            child: const Text(
              'Bắt đầu trả lời câu hỏi',
              style: TextStyle(fontSize: 24.0, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
