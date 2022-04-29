import 'package:flutter/cupertino.dart';
import 'package:todo/providers/todo_search/todo_search_state.dart';

class TodoSearchProvider with ChangeNotifier {
  TodoSearchState _state = TodoSearchState.initial();

  TodoSearchState get state => _state;

  void changeSearchTerm(String searchTerm) {
    _state = _state.copyWith(searchTerm: searchTerm);
    notifyListeners();
  }
}
