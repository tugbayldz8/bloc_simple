part of 'todos_bloc.dart';

@immutable
final class TodosState extends Equatable {
  final List<Todos>? todos;
  final String? error;

  const TodosState({this.todos, this.error});

  @override
  List<Object?> get props => [
        todos,
        error,
      ];

  TodosState copyWith({
    List<Todos>? todos,
    String? error,
  }) {
    return TodosState(
      todos: todos ?? this.todos,
      error: error ?? this.error,
    );
  }
}
