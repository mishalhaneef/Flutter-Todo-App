part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> completedTasks;
  final List<Task> favouriteTasks;
  final List<Task> removedTasks;
  const TaskState({
    this.pendingTasks = const <Task>[],
    this.removedTasks = const <Task>[],
    this.completedTasks = const <Task>[],
    this.favouriteTasks = const <Task>[],
  });

  @override
  List<Object> get props => [
        pendingTasks,
        removedTasks,
        completedTasks,
        pendingTasks,
      ];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({
      'allTasks': pendingTasks.map((x) => x.toMap()).toList(),
      'removedTasks': removedTasks.map((x) => x.toMap()).toList(),
      'completedTasks': completedTasks.map((x) => x.toMap()).toList(),
      'favouriteTasks': favouriteTasks.map((x) => x.toMap()).toList(),
    });

    return result;
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      pendingTasks:
          List<Task>.from(map['allTasks']?.map((x) => Task.fromMap(x))),
      removedTasks:
          List<Task>.from(map['removedTasks']?.map((x) => Task.fromMap(x))),
      completedTasks:
          List<Task>.from(map['completedTasks']?.map((x) => Task.fromMap(x))),
      favouriteTasks:
          List<Task>.from(map['favouriteTasks']?.map((x) => Task.fromMap(x))),
    );
  }
}
