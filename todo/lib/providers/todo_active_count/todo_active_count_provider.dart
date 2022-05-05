import 'package:todo/providers/todo_active_count/todo_active_count_state.dart';
import 'package:todo/providers/todo_list/todo_list_provider.dart';

class TodoActiveCountProvider {
  // Remove ChangeNotifier and get todolist in the controller
  final TodoListProvider todoList;
  TodoActiveCountProvider({
    required this.todoList,
  });

  TodoActiveCountState get state => TodoActiveCountState(
      activeTodoCount: todoList.state.todoList
          .where((todo) => !todo.completed)
          .toList()
          .length);
}
