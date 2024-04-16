import 'dart:convert';
import '../models/question_model.dart';
import '../models/auth_token.dart';
import 'firebase_service.dart';

class QuestionService extends FirebaseService {
  QuestionService([AuthToken? authToken]) : super(authToken);

  Future<Question> addQuestion(Question question) async {
    try {
      final response = await httpFetch(
        '$databaseUrl/questions.json?auth=$token',
        method: HttpMethod.post,
        body: json.encode(
          {
            'title': question.title,
            'options': question.options,
          },
        ),
      ) as Map<String, dynamic>?;
      return question.copyWith(
        id: response!['title'],
      );
    } catch (e) {
      print('Error adding question: $e');
      throw Exception('Failed to add question');
    }
  }

  Future<List<Question>> fetchQuestions() async {
    try {
      final response = await httpFetch('$databaseUrl/questions.json?auth=$token');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<Question> questions = [];

        data.forEach((key, value) {
          questions.add(Question.fromFirebase(
            id: key,
            title: value['title'],
            options: value['options'],
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
}
