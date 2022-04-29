import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Todo extends Equatable {
  String id;
  String desc;
  bool completed;

  Todo({
    String? id,
    required this.desc,
    bool? completed,
  })  : id = id ?? uuid.v4(),
        completed = false;

  Todo copyWith({
    String? id,
    String? desc,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      desc: desc ?? this.desc,
      completed: completed ?? this.completed,
    );
  }

  @override
  String toString() => 'Todo(id: $id, desc: $desc, completed: $completed)';

  @override
  List<Object> get props => [id, desc, completed];
}
