class Task {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final bool completed;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.completed,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'completed': completed,
    };
  }

  Task copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? date,
    bool? completed,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      completed: completed ?? this.completed,
    );
  }
}
