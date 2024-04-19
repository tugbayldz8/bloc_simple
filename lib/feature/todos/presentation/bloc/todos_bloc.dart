import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../model/todos_model.dart';
import '../../service/todos_service.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  late final TodosService _todosService;

  TodosBloc(TodosService service)
      : _todosService = service,
        super(const TodosState()) {
    on<FetchTodosEvent>(_fetchTodos);
  }

  FutureOr<void> _fetchTodos(event, emit) async {
    final response = await _todosService.fetchTodos();
    if (response.error != null) {
      return emit(state.copyWith(error: response.error));
    }
    emit(state.copyWith(todos: response.data));
  }
}
