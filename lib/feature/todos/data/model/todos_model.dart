final class Todos {
  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;

  Todos({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  Todos copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return Todos(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory Todos.fromJson(Map<String, dynamic> json) {
    return Todos(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      completed: json['completed'] as bool?,
    );
  }

  @override
  String toString() =>
      "Todos(userId: $userId,id: $id,title: $title,completed: $completed)";

  @override
  int get hashCode => Object.hash(userId, id, title, completed);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todos &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          id == other.id &&
          title == other.title &&
          completed == other.completed;
}
