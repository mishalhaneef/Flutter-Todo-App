import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String? id;
  final String title;
  final String description;
  final String day;
  final String time;
  bool? isFavourite;
  bool? isDone;
  bool? isDeleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.day,
    required this.time,
    this.isFavourite,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavourite = isFavourite ?? false;
  }

  Task copyWith({
    String? id,
    String? title,
    String? description,
    String? time,
    String? day,
    bool? isDone,
    bool? isDeleted,
    bool? isFavourite,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      day: day ?? this.day,
      time: time ?? this.time,
      isFavourite: isFavourite ?? this.isFavourite,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'time': time});
    result.addAll({'day': day});
    if (isFavourite != null) {
      result.addAll({'isFavourite': isFavourite});
    }
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
      day: map['day'],
      time: map['time'],
      isFavourite: map['isFavourite'],
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        time,
        day,
        isFavourite,
        isDeleted,
        isDone,
      ];

  // String toJson() => json.encode(toMap());
  // factory Task.fromJson(String source) => Task.fromMap(json.decode(source));
}
