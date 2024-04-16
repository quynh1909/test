class Question {
  final String id; // id của câu hỏi trong cơ sở dữ liệu
  final String title; // Tiêu đề của câu hỏi
  final List<String> options; // Các phương án đáp án

  Question({
    required this.id,
    required this.title,
    required this.options,
  });

  @override
  String toString() {
    return 'Question{id: $id, title: $title, options: $options}';
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'options': options,
    };
  }

  static Question fromJson(Map<String, dynamic> json) {
    List<dynamic> optionsJson = json['options'];
    List<String> options = optionsJson.map((option) => option.toString()).toList();
    return Question(
      id: json['id'],
      title: json['title'],
      options: options,
    );
  }
}
