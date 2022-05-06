// import 'package:flutter/cupertino.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:todo/providers/todo_search/todo_search_state.dart';

// remove 'mixin ChangeNotifier' and extends StateNotifier
// class TodoSearchProvider with ChangeNotifier {
class TodoSearchProvider extends StateNotifier<TodoSearchState> {
  // don't initialize the state here bug delegate it to statenotifier
  // TodoSearchState _state = TodoSearchState.initial();

  TodoSearchProvider() : super(TodoSearchState.initial());

  // using state notifier give us the possibility to directly access the state
  // TodoSearchState get state => _state;

  void changeSearchTerm(String searchTerm) {
    state = state.copyWith(searchTerm: searchTerm);
    // no longer need notifier Listerners, state state notifier will notifier user
    // notifyListeners();
  }
}
