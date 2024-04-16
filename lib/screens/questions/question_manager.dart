import 'package:flutter/foundation.dart';
import '../../models/auth_token.dart';
import '../../models/question_model.dart';
import '../../services/question_service.dart';

class QuestionManager with ChangeNotifier {
  final QuestionService _questionService;

  QuestionManager(this._questionService);

  List<Question> _questions = [];
  List<Question> get questions => [..._questions];

  set authToken(AuthToken? authToken){
    _questionService.authToken = authToken;
  }

  Future<void> fetchQuestions() async {
    try {
      _questions = await _questionService.fetchQuestions();
      notifyListeners();
    } catch (e) {
      print('Error fetching questions: $e');
      throw Exception('Failed to fetch questions');
    }
  }

  Future<void> addQuestion(Question question) async {
    try {
      await _questionService.addQuestion(question);
      _questions.add(question);
      notifyListeners();
    } catch (e) {
      print('Error adding question: $e');
      throw Exception('Failed to add question');
    }
  }
}
