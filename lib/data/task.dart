class Task {
  Task({required this.name, this.isComplete = false});

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        name: json['name'],
        isComplete: json['isComplete'],
      );

  final String name;
  bool isComplete;

  Map<String, dynamic> toJson() => {
        'name': name,
        'isComplete': isComplete,
      };
}
