import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/todo_list/todo_list_provider.dart';

class CreateTodoComponent extends StatefulWidget {
  const CreateTodoComponent({Key? key}) : super(key: key);

  @override
  State<CreateTodoComponent> createState() => _CreateTodoComponentState();
}

class _CreateTodoComponentState extends State<CreateTodoComponent> {
  final searchFieldController = new TextEditingController();

  @override
  void dispose() {
    searchFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchFieldController,
      decoration: const InputDecoration(label: Text('What to do ?')),
      onSubmitted: (todoDesc) {
        if (todoDesc != null && todoDesc.trim().isNotEmpty) {
          context.read<TodoListProvider>().addTodo(todoDesc);
        }
        searchFieldController.clear();
      },
    );
  }
}
