import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/task.model.dart';

final taskControllerProvider =
    StateNotifierProvider<TaskController, List<Task>>((ref) {
  return TaskController();
});

class TaskController extends StateNotifier<List<Task>> {
  TaskController() : super([]);

  void addTask() {
    final task = Task(
      id: DateTime.now().toString(),
      title: 'New Task',
      description: '',
      date: DateTime.now(),
      completed: false,
    );
    state = [...state, task];
  }

  void toggleTask(Task task) {
    state = state.map((t) {
      if (t.id == task.id) {
        return task.copyWith(completed: !task.completed);
      }
      return t;
    }).toList();
  }

  List<Task> get allTasks => state;
  List<Task> get incompleteTasks => state.where((t) => !t.completed).toList();
  List<Task> get completeTasks => state.where((t) => t.completed).toList();

  void deleteTask(Task task) {
    state = state.where((t) => t.id != task.id).toList();
  }
}
