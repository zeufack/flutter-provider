import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/filter.dart';
import 'package:todo/providers/todo_filter/todo_filter_provider.dart';
import 'package:todo/providers/todo_search/todo_search_provider.dart';

class FilterTodoComponent extends StatelessWidget {
  const FilterTodoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
              label: Text('search todos'),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
              filled: true),
          onChanged: (searchTerm) {
            if (searchTerm != null) {
              context.read<TodoSearchProvider>().changeSearchTerm(searchTerm);
            }
          },
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(context, Filter.all),
            filterButton(context, Filter.active),
            filterButton(context, Filter.completed)
          ],
        )
      ],
    );
  }

  Widget filterButton(BuildContext context, Filter filter) {
    return TextButton(
      onPressed: () {
        context.read<TodoFilterProvider>().changeFilter(filter);
      },
      child: Text(
        filter == Filter.all
            ? 'All'
            : filter == Filter.active
                ? 'Active'
                : 'Completed',
        style: TextStyle(
          fontSize: 18.0,
          color: filterBUttonColor(context, filter),
        ),
      ),
    );
  }

  Color filterBUttonColor(BuildContext context, Filter filter) {
    return context.watch<TodoFilterProvider>().state.filter == filter
        ? Colors.blue
        : Colors.grey;
  }
}
