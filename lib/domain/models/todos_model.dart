import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String id;
  final String task;
  final String time;
  final String day;
  bool? isCompleted;

  Todo({
    required this.id,
    required this.task,
    required this.day,
    required this.time,
    this.isCompleted,
  }) {
    isCompleted = isCompleted ?? false;
  }

  Todo copyWith({
    String? task,
    String? description,
    String? time,
    String? day,
    bool? isCompleted,
  }) {
    return Todo(
      id: id,
      task: task ?? this.task,
      day: day ?? this.day,
      time: time ?? this.time,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        task,
        isCompleted,
      ];

  static List<Todo> todos = [
    Todo(
      id: '1',
      task: 'Design the MVP',
      day: 'Monday',
      time: '8:00 pm',
      isCompleted: true,
    ),
    Todo(
      id: '2',
      task: 'Meet Project manager to plan rest projects ',
      day: 'Tuesday',
      time: '2:00 pm',
      isCompleted: false,
    ),
    Todo(
      id: '3',
      task: 'Start developing mvp desigin within 1 pm',
      day: 'Friday',
      time: '10:00 am',
      isCompleted: false,
    )
  ];
}
