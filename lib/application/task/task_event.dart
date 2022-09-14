part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TaskEvent {
  final Task task;
  const AddTask({
    required this.task,
  });

  @override
  List<Object> get props => [];
}

class UpdateTask extends TaskEvent {
  final Task task;
  const UpdateTask({
    required this.task,
  });

  @override
  List<Object> get props => [];
}

class DeleteTask extends TaskEvent {
  final Task task;
  const DeleteTask({
    required this.task,
  });

  @override
  List<Object> get props => [];
}

class RemoveTask extends TaskEvent {
  final Task task;
  const RemoveTask({
    required this.task,
  });

  @override
  List<Object> get props => [];
}
