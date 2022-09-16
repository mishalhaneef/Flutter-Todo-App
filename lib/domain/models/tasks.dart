import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String? id;
  final String title;
  final String description;
  bool? isDone;
  bool? isDeleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith({
    String? id,
    String? title,
    String? description,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'description': description});
    if (isDone != null) {
      result.addAll({'isDone': isDone});
    }
    if (isDeleted != null) {
      result.addAll({'isDeleted': isDeleted});
    }

    return result;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'],
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        isDeleted,
        isDone,
      ];

  // String toJson() => json.encode(toMap());

  // factory Task.fromJson(String source) => Task.fromMap(json.decode(source));
}
