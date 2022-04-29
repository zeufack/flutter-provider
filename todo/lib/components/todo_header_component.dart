import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_active_count/todo_active_count_provider.dart';

class TodoHeaderComponent extends StatelessWidget {
  const TodoHeaderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'TODO',
          style: TextStyle(fontSize: 40.0),
        ),
        Text(
          '${context.watch<TodoActiveCountProvider>().state.activeTodoCount} items remains',
          style: const TextStyle(fontSize: 20.0, color: Colors.redAccent),
        )
      ],
    );
  }
}
