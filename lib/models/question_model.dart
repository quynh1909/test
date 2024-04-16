import 'dart:convert';

class Question {
  final String id;
  final String title;
  final List<String> options;

  Question({
    required this.id,
    required this.title,
    required this.options,
  });

  factory Question.fromFirebase({
    required String id,
    required String title,
    required List<dynamic> options,
  }) {
    return Question(
      id: id,
      title: title,
      options: options.cast<String>(),
    );
  }

  Question copyWith({
    String? id,
    String? title,
    List<String>? options,
  }) {
    return Question(
      id: id ?? this.id,
      title: title ?? this.title,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'options': options,
    };
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) => Question.fromMap(json.decode(source));

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      title: map['title'],
      options: List<String>.from(map['options']),
    );
  }
}
