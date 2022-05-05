import 'package:flutter/cupertino.dart';

import 'package:todo/model/filter.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/providers/filtered_todo/filtered_todo_state.dart';
import 'package:todo/providers/todo_filter/todo_filter_provider.dart';
import 'package:todo/providers/todo_list/todo_list_provider.dart';
import 'package:todo/providers/todo_search/todo_search_provider.dart';

class FilteredTodoProvider with ChangeNotifier {
  final TodoListProvider todoListProvider;
  final TodoFilterProvider todoFilterProvider;
  final TodoSearchProvider todoSearchProvider;

  FilteredTodoProvider({
    required this.todoListProvider,
    required this.todoFilterProvider,
    required this.todoSearchProvider,
  });

  FilteredTodoState get state {
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

    return FilteredTodoState(filteredTodoList: _filteredTodos);
  }
}
