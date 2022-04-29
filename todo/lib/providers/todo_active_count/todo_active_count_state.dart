import 'package:equatable/equatable.dart';

class TodoActiveCountState extends Equatable {
  final int activeTodoCount;
  const TodoActiveCountState({
    required this.activeTodoCount,
  });

  factory TodoActiveCountState.initial() {
    return const TodoActiveCountState(activeTodoCount: 0);
  }

  @override
  List<Object> get props => [activeTodoCount];

  @override
  String toString() =>
      'TodoActiveCountState(activeTodoCount: $activeTodoCount)';

  TodoActiveCountState copyWith({
    int? activeTodoCount,
  }) {
    return TodoActiveCountState(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }
}
