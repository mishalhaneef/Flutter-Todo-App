import 'package:bloc_change_text/application/bloc_exports.dart';
import 'package:bloc_change_text/domain/models/tasks.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
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
        /// adding the data from user to the existing list from the bloc
        /// state class. here that is [TaskState]
        pendingTasks: List.from(state.pendingTasks)..add(event.task),
        completedTasks: state.completedTasks,
        favouriteTasks: state.favouriteTasks,
        // keeping the removed task as same
        ///* this data is keeping here cos when the event triggered the state will rebuild
        ///* so the removed task will be empty cos there will be nothing in this state
        ///* if this line of code isn't add
        removedTasks: state.removedTasks,
      ),
    );
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;

    task.isDone == false
        ? {
            pendingTasks = List.from(pendingTasks)..remove(task),
            completedTasks = List.from(completedTasks)
              ..insert(0, task.copyWith(isDone: true)),
          }
        : {
            completedTasks = List.from(completedTasks)..remove(task),
            pendingTasks = List.from(pendingTasks)
              ..insert(0, task.copyWith(isDone: false)),
          };

    emit(TaskState(
      pendingTasks: pendingTasks,
      completedTasks: completedTasks,
      favouriteTasks: state.favouriteTasks,
      removedTasks: state.removedTasks,
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(
      TaskState(
          pendingTasks: state.pendingTasks,
          completedTasks: state.completedTasks,
          favouriteTasks: state.favouriteTasks,
          removedTasks: List.from(state.removedTasks)..remove(event.task)),
    );
  }

  void _onRemoveTask(RemoveTask event, Emitter<TaskState> emit) {
    final state = this.state;

    emit(
      TaskState(
        pendingTasks: List.from(state.pendingTasks)..remove(event.task),
        completedTasks: List.from(state.completedTasks)..remove(event.task),
        favouriteTasks: List.from(state.favouriteTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(event.task.copyWith(isDeleted: true)),
      ),
    );
  }

  // void _onAddToFavouriteTask(
  //     AddToFavouriteTask event, Emitter<TaskState> emit) {
  //   final state = this.state;

  //   emit(TaskState(
  //     pendingTasks: state.pendingTasks,
  //     completedTasks: state.completedTasks,
  //     favouriteTasks: List.from(state.favouriteTasks)..insert(0, event.task),
  //     removedTasks: state.removedTasks,
  //   ));
  // }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
