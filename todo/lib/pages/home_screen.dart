import 'package:flutter/material.dart';
import 'package:todo/components/todo_header_component.dart';
import 'package:todo/components/todo_create_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Center(
            child: Column(
              children: const [TodoHeaderComponent(), CreateTodoComponent()],
            ),
          ),
        ),
      ),
    );
  }
}
