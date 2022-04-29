import 'package:flutter/cupertino.dart';
import 'package:todo/model/filter.dart';
import 'package:todo/providers/todo_filter/todo_filter_state.dart';

class TodoFilterProvider with ChangeNotifier {
  TodoFilterState _state = TodoFilterState.initial();

  TodoFilterState get state => _state;

  void changeFilter(Filter filter) {
    _state = _state.copyWith(filter: filter);
    notifyListeners();
  }
}
