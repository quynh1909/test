import 'dart:convert';
import '../models/question_model.dart';
import '../models/auth_token.dart';
import 'firebase_service.dart';

class QuestionService extends FirebaseService {
  QuestionService([AuthToken? authToken]) : super(authToken);

  Future<List<Question>> fetchQuestions() async {
    try {
      final response = await httpFetch('$databaseUrl/questions.json');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<Question> questions = [];

        data.forEach((key, value) {
          questions.add(Question.fromFirebase(
            id: key,
            title: value['title'],
            options: List<String>.from(value['options']),
          ));
        });

        return questions;
      } else {
        throw Exception('Failed to fetch questions');
      }
    } catch (e) {
      print('Error fetching questions: $e');
      throw Exception('Failed to fetch questions');
    }
  }

  Future<void> addQuestion(Question question) async {
    try {
      await httpFetch(
        '$databaseUrl/questions.json',
        method: HttpMethod.post,
        body: json.encode({
          'title': question.title,
          'options': question.options,
        }),
      );
    } catch (e) {
      print('Error adding question: $e');
      throw Exception('Failed to add question');
    }
  }
}
