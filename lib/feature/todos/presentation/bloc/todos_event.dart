part of 'todos_bloc.dart';

@immutable
sealed class TodosEvent {
}

final class FetchTodosEvent extends TodosEvent{}