import 'package:equatable/equatable.dart';

import 'package:todo/model/filter.dart';

class TodoFilterState extends Equatable {
  final Filter filter;

  const TodoFilterState({
    required this.filter,
  });

  @override
  String toString() => 'TodoFilterState(filter: $filter)';

  factory TodoFilterState.initial() {
    return const TodoFilterState(filter: Filter.all);
  }

  TodoFilterState copyWith({
    Filter? filter,
  }) {
    return TodoFilterState(
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object> get props => [filter];
}
