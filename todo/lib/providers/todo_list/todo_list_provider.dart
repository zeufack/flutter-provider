// import 'package:flutter/cupertino.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/providers/todo_list/todo_list_state.dart';

// remove mixin changenotifier and extends StateNotifier to simplify operations
// class TodoListProvider with ChangeNotifier {

class TodoListProvider extends StateNotifier<TodoListState> {
  // delegate state initialization to state notifier
  // TodoListState _state = TodoListState.initial();

  TodoListProvider() : super(TodoListState.initial());

  // state notifier already provide a state field
  // TodoListState get state => _state;

  void addTodo(String desc) {
    final Todo newTodo = Todo(desc: desc);
    final newTodos = [...state.todoList, newTodo];
    state = state.copyWith(todoList: newTodos);
    // notifyListeners();
  }

  void editTodo(String id, String newDesc) {
    final newTodos = state.todoList.map((todo) {
      if (todo.id == id) {
        return Todo(desc: newDesc, id: todo.id, completed: todo.completed);
      }
      return todo;
    }).toList();
    state = state.copyWith(todoList: newTodos);
    // notifyListeners();
  }

  void toggelTodo(String id) {
    final newTodos = state.todoList.map((todo) {
      if (todo.id == id) {
        return Todo(desc: todo.desc, id: todo.id, completed: !todo.completed);
      }
      return todo;
    }).toList();
    state = state.copyWith(todoList: newTodos);
    // notifyListeners();
  }

  void deleteTodo(String id) {
    final newTodos = state.todoList.where((todo) => todo.id != id).toList();
    state = state.copyWith(todoList: newTodos);
    // notifyListeners();
  }
}
