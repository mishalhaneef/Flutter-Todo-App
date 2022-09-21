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
    on<MarkFavOrUnFavTask>(_onMarkFavOrUnFavTask);
    on<EditTask>(_onEditTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
    on<RestoreTask>(_onRestoreTask);
    on<ClearBin>(_onClearBin);
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
    List<Task> favouriteTasks = state.favouriteTasks;

    if (task.isDone == false) {
      if (task.isFavourite == false) {
        pendingTasks = List.from(pendingTasks)..remove(task);
        completedTasks = List.from(completedTasks)
          ..insert(0, task.copyWith(isDone: true));
      } else {
        var taskIndex = favouriteTasks.indexOf(task);

        pendingTasks = List.from(pendingTasks)..remove(task);
        completedTasks.insert(0, task.copyWith(isDone: true));
        favouriteTasks = List.from(favouriteTasks)
          ..remove(task)
          ..insert(taskIndex, task.copyWith(isDone: true));
      }
    } else {
      if (task.isFavourite == false) {
        completedTasks = List.from(completedTasks)..remove(task);
        pendingTasks = List.from(pendingTasks)
          ..insert(0, task.copyWith(isDone: false));
      } else {
        var taskIndex = favouriteTasks.indexOf(task);
        completedTasks = List.from(completedTasks)..remove(task);
        pendingTasks = List.from(pendingTasks)
          ..insert(0, task.copyWith(isDone: false));
        favouriteTasks = List.from(favouriteTasks)
          ..remove(task)
          ..insert(taskIndex, task.copyWith(isDone: false));
      }
    }
    ;

    emit(TaskState(
      pendingTasks: pendingTasks,
      completedTasks: completedTasks,
      favouriteTasks: favouriteTasks,
      removedTasks: state.removedTasks,
    ));
  }

// adding task to favourite
  void _onMarkFavOrUnFavTask(
      MarkFavOrUnFavTask event, Emitter<TaskState> emit) {
    final state = this.state;
    // fetching the state properties to a variable
    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;
    List<Task> favouriteTasks = state.favouriteTasks;
    // this comparison is coded because we have to display in the homepage also
    // in the completed task screen if the favourited task is completed one
    if (event.task.isDone == false) {
      //* and if the task is marked as favourtie
      /// (the value is false if the task is not marked as
      /// favourite already. so it'll be true after only marking as favourite)
      if (event.task.isFavourite == false) {
        // getting index from the list to place the new value
        var taskIndex = pendingTasks.indexOf(event.task);
        pendingTasks = List.from(pendingTasks)
          // removing the current event task
          ..remove(event.task)
          // and adding new one with favourite instance as true so that we
          // can show  as it is favourited
          ..insert(taskIndex, event.task.copyWith(isFavourite: true));
        // also adding the task to list of [favouritetask]
        favouriteTasks.insert(0, event.task.copyWith(isFavourite: true));
      } else {
        // if favourite is undone (means the favourite is true already)
        var taskIndex = pendingTasks.indexOf(event.task);
        pendingTasks = List.from(pendingTasks)
          // removing the task
          ..remove(event.task)
          //and inserting new task as the facourite instance as false
          ..insert(taskIndex, event.task.copyWith(isFavourite: false));
        // also removing from the favourite list
        favouriteTasks.remove(event.task);
      }
    } else {
      if (event.task.isFavourite == false) {
        // getting index from the list to place the new value
        var taskIndex = completedTasks.indexOf(event.task);
        completedTasks = List.from(completedTasks)
          // removing the current event task
          ..remove(event.task)
          // and adding new one with favourite instance as true so that we
          // can show  as it is favourited
          ..insert(taskIndex, event.task.copyWith(isFavourite: true));
        // also adding the task to list of [favouritetask]
        favouriteTasks.insert(0, event.task.copyWith(isFavourite: true));
      } else {
        // if favourite is undone (means the favourite is true already)
        var taskIndex = completedTasks.indexOf(event.task);
        completedTasks = List.from(completedTasks)
          // removing the task
          ..remove(event.task)
          //and inserting new task as the facourite instance as false
          ..insert(taskIndex, event.task.copyWith(isFavourite: false));
        // also removing from the favourite list
        favouriteTasks.remove(event.task);
      }
    }
    emit(TaskState(
      pendingTasks: pendingTasks,
      completedTasks: completedTasks,
      favouriteTasks: favouriteTasks,
      removedTasks: state.removedTasks,
    ));
  }

  void _onEditTask(EditTask event, Emitter<TaskState> emit) {
    final state = this.state;
    List<Task> favouriteTasks = state.favouriteTasks;

    if (event.oldTask.isFavourite == true) {
      // if the old task is marked as favourite, removing old task
      // from the favourite task and adding the new one
      favouriteTasks
        ..remove(event.oldTask)
        ..insert(0, event.newTask);
    }
    emit(
      TaskState(
        // doing the same in pending task lis
        pendingTasks: List.from(state.pendingTasks)
          ..remove(event.oldTask)
          ..insert(0, event.newTask),
        // doing the same here,here can use both
        // method to remove and add events.
        completedTasks: state.completedTasks..remove(event.oldTask),
        favouriteTasks: favouriteTasks,
        removedTasks: state.removedTasks,
      ),
    );
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

  void _onRestoreTask(RestoreTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
      removedTasks: List.from(state.removedTasks)..remove(event.task),
      pendingTasks: List.from(state.pendingTasks)
        ..insert(
            0,
            event.task.copyWith(
              isDeleted: false,
              isDone: false,
              isFavourite: false,
            )),
      completedTasks: state.completedTasks,
      favouriteTasks: state.favouriteTasks,
    ));
  }

  void _onClearBin(ClearBin event, Emitter<TaskState> emit) {
    final state = this.state;

    emit(
      TaskState(
          pendingTasks: List.from(state.pendingTasks),
          completedTasks: List.from(state.completedTasks),
          favouriteTasks: List.from(state.favouriteTasks),
          removedTasks: List.from(state.removedTasks)..clear()),
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
