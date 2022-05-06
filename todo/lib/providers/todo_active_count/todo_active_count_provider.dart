// import 'package:flutter/cupertino.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:todo/model/todo.dart';

import 'package:todo/providers/todo_active_count/todo_active_count_state.dart';
// import 'package:todo/providers/todo_list/todo_list_provider.dart';
import 'package:todo/providers/todo_list/todo_list_state.dart';

// remove mixin ChangeNotifier and extens StateNotifier
// class TodoActiveCountProvider with ChangeNotifier {
class TodoActiveCountProvider extends StateNotifier<TodoActiveCountState>
    with LocatorMixin {
  // final int initalActiveTodoCount;
  // late TodoActiveCountState _state;

  TodoActiveCountProvider() : super(TodoActiveCountState.initial());

  // TodoActiveCountProvider({
  //   required this.initalActiveTodoCount,
  // }) {
  //   _state = TodoActiveCountState(activeTodoCount: initalActiveTodoCount);
  // }

  // TodoActiveCountState get state => _state;

  // void update(TodoListProvider todoList) {
  //   final activeTodoCount = todoList.state.todoList
  //       .where((todo) => !todo.completed)
  //       .toList()
  //       .length;
  //   _state = _state.copyWith(activeTodoCount: activeTodoCount);
  //   notifyListeners();
  // }

  // override update method from locator
  @override
  void update(Locator watch) {
    // use the watch method to listen on todolist change
    final List<Todo> todos = watch<TodoListState>().todoList;
    final activeTodoCount =
        todos.where((todo) => !todo.completed).toList().length;
    state = state.copyWith(activeTodoCount: activeTodoCount);
    // notifyListeners();
    super.update(watch);
  }
}
