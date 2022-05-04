import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/components/todo_item_component.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/providers/filtered_todo/filtered_todo_provider.dart';
import 'package:todo/providers/todo_list/todo_list_provider.dart';

class ShowTodoComponent extends StatelessWidget {
  const ShowTodoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Todo> filteredTodoList =
        context.watch<FilteredTodoProvider>().state.filteredTodoList;

    return ListView.separated(
      itemCount: filteredTodoList.length,
      primary: false,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          onDismissed: (direction) {
            context
                .read<TodoListProvider>()
                .deleteTodo(filteredTodoList[index].id);
          },
          confirmDismiss: (_) {
            return showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Are you sure ?'),
                    content:
                        const Text('Do you realy want to delete this item ?'),
                    actions: [
                      TextButton(
                        onPressed: (() => Navigator.pop(context, false)),
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: (() => Navigator.pop(context, true)),
                        child: const Text('YES'),
                      ),
                    ],
                  );
                });
          },
          key: ValueKey(filteredTodoList[index].id),
          child: TodoItem(todo: filteredTodoList[index]),
          background: showBackgroud(0),
          secondaryBackground: showBackgroud(1),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Colors.grey,
        );
      },
    );
  }

  Widget showBackgroud(int direction) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      color: Colors.red,
      child: const Icon(
        Icons.delete,
        size: 30.0,
        color: Colors.white,
      ),
    );
  }
}
