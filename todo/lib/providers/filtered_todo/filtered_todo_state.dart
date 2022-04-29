import 'package:equatable/equatable.dart';

import 'package:todo/model/todo.dart';

class FilteredTodoState extends Equatable {
  final List<Todo> filteredTodoList;
  const FilteredTodoState({
    required this.filteredTodoList,
  });

  @override
  List<Object> get props => [filteredTodoList];

  factory FilteredTodoState.initial() {
    return const FilteredTodoState(filteredTodoList: []);
  }

  @override
  String toString() => 'FilteredTodoState(filteredTodoList: $filteredTodoList)';

  FilteredTodoState copyWith({
    List<Todo>? filteredTodoList,
  }) {
    return FilteredTodoState(
      filteredTodoList: filteredTodoList ?? this.filteredTodoList,
    );
  }
}
