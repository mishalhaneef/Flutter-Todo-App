import 'package:bloc/bloc.dart';
import 'package:bloc_change_text/application/bloc_exports.dart';
import 'package:bloc_change_text/domain/models/tasks.dart';
import 'package:equatable/equatable.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(
      TaskState(
        allTasks: List.from(state.allTasks)..add(event.task),
        removedTasks: state.removedTasks,
      ),
    );
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;

    final int index = state.allTasks.indexOf(task);

    List<Task> allTasks = List.from(state.allTasks)..remove(task);

    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));

    emit(TaskState(
      allTasks: allTasks,
      removedTasks: state.removedTasks,
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(
      TaskState(
        allTasks: state.allTasks,
        removedTasks: List.from(state.removedTasks)..remove(event.task)
      ),
    );
  }

  void _onRemoveTask(RemoveTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(
      TaskState(
        allTasks: List.from(state.allTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(event.task.copyWith(isDeleted: true)),
      ),
    );
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
