class Todo {
  final String title;
  final String description;
  final DateTime createdAt;
  final String status;

  const Todo({
    required this.title,
    required this.description,
    required this.createdAt,
    required this.status,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'createdAt': createdAt.toIso8601String(),
        'status': status,
      };

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'] as String,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: json['status'] as String,
    );
  }
}
