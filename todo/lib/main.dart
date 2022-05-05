import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/pages/home_screen.dart';
import 'package:todo/providers/filtered_todo/filtered_todo_provider.dart';
import 'package:todo/providers/todo_active_count/todo_active_count_provider.dart';
import 'package:todo/providers/todo_filter/todo_filter_provider.dart';
import 'package:todo/providers/todo_list/todo_list_provider.dart';
import 'package:todo/providers/todo_search/todo_search_provider.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoListProvider>(
          create: (context) => TodoListProvider(),
        ),
        ChangeNotifierProvider<TodoFilterProvider>(
          create: (context) => TodoFilterProvider(),
        ),
        ChangeNotifierProvider<TodoSearchProvider>(
          create: (context) => TodoSearchProvider(),
        ),
        ProxyProvider<TodoListProvider, TodoActiveCountProvider>(
          update: (
            BuildContext context,
            TodoListProvider todoListProvider,
            TodoActiveCountProvider? _,
          ) =>
              TodoActiveCountProvider(
            todoList: todoListProvider,
          ),
        ),
        ProxyProvider3<TodoFilterProvider, TodoSearchProvider, TodoListProvider,
            FilteredTodoProvider>(
          update: ((context,
                  TodoFilterProvider todoFilterProvider,
                  TodoSearchProvider todoSearchProvider,
                  TodoListProvider todoListProvider,
                  FilteredTodoProvider? _) =>
              FilteredTodoProvider(
                  todoListProvider: todoListProvider,
                  todoFilterProvider: todoFilterProvider,
                  todoSearchProvider: todoSearchProvider)),
        ),
      ],
      child: MaterialApp(
        title: 'Todos',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
