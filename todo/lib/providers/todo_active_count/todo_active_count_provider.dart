import 'package:flutter/cupertino.dart';

import 'package:todo/providers/todo_active_count/todo_active_count_state.dart';
import 'package:todo/providers/todo_list/todo_list_provider.dart';

class TodoActiveCountProvider with ChangeNotifier {
  final int initalActiveTodoCount;
  late TodoActiveCountState _state;

  TodoActiveCountProvider({
    required this.initalActiveTodoCount,
  }) {
    _state = TodoActiveCountState(activeTodoCount: initalActiveTodoCount);
  }

  TodoActiveCountState get state => _state;

  void update(TodoListProvider todoList) {
    final activeTodoCount = todoList.state.todoList
        .where((todo) => !todo.completed)
        .toList()
        .length;
    _state = _state.copyWith(activeTodoCount: activeTodoCount);
    notifyListeners();
  }
}
