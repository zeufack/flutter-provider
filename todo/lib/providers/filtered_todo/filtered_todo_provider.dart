import 'package:flutter/cupertino.dart';
import 'package:todo/model/filter.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/providers/filtered_todo/filtered_todo_state.dart';
import 'package:todo/providers/todo_filter/todo_filter_provider.dart';
import 'package:todo/providers/todo_list/todo_list_provider.dart';
import 'package:todo/providers/todo_search/todo_search_provider.dart';

class FilteredTodoProvider with ChangeNotifier {
  FilteredTodoState _state = FilteredTodoState.initial();

  FilteredTodoState get state => _state;

  void update(
      TodoFilterProvider todoFilterProvider,
      TodoListProvider todoListProvider,
      TodoSearchProvider todoSearchProvider) {
    List<Todo> _filteredTodos;
    switch (todoFilterProvider.state.filter) {
      case Filter.all:
        _filteredTodos = todoListProvider.state.todoList;

        break;
      case Filter.active:
        _filteredTodos = todoListProvider.state.todoList
            .where((todo) => !todo.completed)
            .toList();
        break;
      case Filter.completed:
        _filteredTodos = todoListProvider.state.todoList
            .where((todo) => todo.completed)
            .toList();
        break;
      default:
        _filteredTodos = todoListProvider.state.todoList;
        break;
    }

    if (todoSearchProvider.state.searchTerm.isNotEmpty) {
      _filteredTodos = _filteredTodos
          .where((todo) => todo.desc
              .toLowerCase()
              .contains(todoSearchProvider.state.searchTerm))
          .toList();
    }

    _state = _state.copyWith(filteredTodoList: _filteredTodos);
    notifyListeners();
  }
}
