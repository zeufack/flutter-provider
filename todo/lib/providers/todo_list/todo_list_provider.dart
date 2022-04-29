import 'package:flutter/cupertino.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/providers/todo_list/todo_list_state.dart';

class TodoListProvider with ChangeNotifier {
  TodoListState _state = TodoListState.initial();

  TodoListState get state => _state;

  void addTodo(String desc) {
    final Todo newTodo = Todo(desc: desc);
    final newTodos = [..._state.todoList, newTodo];
    _state = _state.copyWith(todoList: newTodos);
    notifyListeners();
  }

  void editTodo(String id, String newDesc) {
    final newTodos = _state.todoList.map((todo) {
      if (todo.id == id) {
        return Todo(desc: newDesc, id: todo.id, completed: todo.completed);
      }
      return todo;
    }).toList();
    _state = _state.copyWith(todoList: newTodos);
    notifyListeners();
  }

  void toggelTodo(String id) {
    final newTodos = _state.todoList.map((todo) {
      if (todo.id == id) {
        return Todo(desc: todo.desc, id: todo.id, completed: !todo.completed);
      }
      return todo;
    }).toList();
    _state = _state.copyWith(todoList: newTodos);
    notifyListeners();
  }

  void deleteTodo(String id) {
    final newTodos = _state.todoList.where((todo) => todo.id != id).toList();
    _state = _state.copyWith(todoList: newTodos);
    notifyListeners();
  }
}
