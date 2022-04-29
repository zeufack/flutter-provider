import 'package:equatable/equatable.dart';

import 'package:todo/model/todo.dart';

class TodoListState extends Equatable {
  final List<Todo> todoList;

  const TodoListState({
    required this.todoList,
  });

  @override
  String toString() => 'TodoListState(todoList: $todoList)';

  factory TodoListState.initial() {
    return TodoListState(todoList: [
      Todo(desc: "task 1"),
      Todo(desc: "task 2"),
      Todo(desc: "task 3")
    ]);
  }

  TodoListState copyWith({
    List<Todo>? todoList,
  }) {
    return TodoListState(
      todoList: todoList ?? this.todoList,
    );
  }

  @override
  List<Object> get props => [todoList];
}
