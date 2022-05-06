import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:todo/pages/home_screen.dart';
import 'package:todo/providers/filtered_todo/filtered_todo_provider.dart';
import 'package:todo/providers/filtered_todo/filtered_todo_state.dart';
import 'package:todo/providers/todo_active_count/todo_active_count_provider.dart';
import 'package:todo/providers/todo_active_count/todo_active_count_state.dart';
import 'package:todo/providers/todo_filter/todo_filter_provider.dart';
import 'package:todo/providers/todo_filter/todo_filter_state.dart';
import 'package:todo/providers/todo_list/todo_list_provider.dart';
import 'package:todo/providers/todo_list/todo_list_state.dart';
import 'package:todo/providers/todo_search/todo_search_provider.dart';
import 'package:todo/providers/todo_search/todo_search_state.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider<TodoListProvider>(
        //   create: (context) => TodoListProvider(),
        // ),
        // ChangeNotifierProvider<TodoFilterProvider>(
        //   create: (context) => TodoFilterProvider(),
        // ),
        // ChangeNotifierProvider<TodoSearchProvider>(
        //   create: (context) => TodoSearchProvider(),
        // ),
        // ChangeNotifierProxyProvider<TodoListProvider, TodoActiveCountProvider>(
        //   create: (context) => TodoActiveCountProvider(
        //       initalActiveTodoCount:
        //           context.read<TodoListProvider>().state.todoList.length),
        //   update: (BuildContext context, TodoListProvider todoListProvider,
        //           TodoActiveCountProvider? todoActiveCountProvider) =>
        //       todoActiveCountProvider!..update(todoListProvider),
        // ),
        // ChangeNotifierProxyProvider3<TodoListProvider, TodoSearchProvider,
        //     TodoFilterProvider, FilteredTodoProvider>(
        //   create: (context) => FilteredTodoProvider(),
        //   update: (BuildContext context,
        //           TodoListProvider todoListProvider,
        //           TodoSearchProvider todoSearchProvider,
        //           TodoFilterProvider todoFilterProvider,
        //           FilteredTodoProvider? filteredTodoProvider) =>
        //       filteredTodoProvider!
        //         ..update(
        //             todoFilterProvider, todoListProvider, todoSearchProvider),
        // ),
        StateNotifierProvider<TodoListProvider, TodoListState>(
          create: (context) => TodoListProvider(),
        ),
        StateNotifierProvider<TodoFilterProvider, TodoFilterState>(
          create: (context) => TodoFilterProvider(),
        ),
        StateNotifierProvider<TodoSearchProvider, TodoSearchState>(
          create: (context) => TodoSearchProvider(),
        ),
        StateNotifierProvider<TodoActiveCountProvider, TodoActiveCountState>(
          create: (context) => TodoActiveCountProvider(),
        ),
        StateNotifierProvider<FilteredTodoProvider, FilteredTodoState>(
          create: (context) => FilteredTodoProvider(),
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
