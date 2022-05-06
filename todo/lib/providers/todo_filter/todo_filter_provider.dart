import 'package:state_notifier/state_notifier.dart';
import 'package:todo/model/filter.dart';
import 'package:todo/providers/todo_filter/todo_filter_state.dart';

class TodoFilterProvider extends StateNotifier<TodoFilterState> {
  TodoFilterProvider() : super(TodoFilterState.initial());

  void changeFilter(Filter filter) {
    state = state.copyWith(filter: filter);
  }
}
