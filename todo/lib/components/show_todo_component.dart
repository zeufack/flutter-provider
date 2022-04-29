import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/providers/filtered_todo/filtered_todo_provider.dart';

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
          onDismissed: (direction) {},
          key: ValueKey(filteredTodoList[index].id),
          child: Text(
            filteredTodoList[index].desc,
            style: const TextStyle(fontSize: 20.0),
          ),
          background: showBackgroud(),
          secondaryBackground: showBackgroud(),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Colors.grey,
        );
      },
    );
  }

  Widget showBackgroud() {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.red,
      child: const Icon(
        Icons.delete,
        size: 30.0,
        color: Colors.white,
      ),
    );
  }
}
