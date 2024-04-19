import 'package:bloc_simple/feature/todos/model/todos_model.dart';
import 'package:bloc_simple/feature/todos/presentation/bloc/todos_bloc.dart';
import 'package:bloc_simple/feature/todos/service/todos_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodosView extends StatelessWidget {
  const TodosView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosBloc(TodosService())..add(FetchTodosEvent()),
      child: const Scaffold(
        body: _ListViewBuilder(),
      ),
    );
  }
}

class _ListViewBuilder extends StatelessWidget {
  const _ListViewBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        if (state.error != null) return Text(state.error ?? '');
        if (state.todos == null) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return ListView.builder(
          itemCount: state.todos?.length,
          itemBuilder: (context, index) {
            Todos? todos = state.todos?[index];
            if (todos == null) return Container();
            return ListTile(
              title: Text(todos.title ?? ''),
              subtitle: Text((todos.userId ?? 0).toString()),
            );
          },
        );
      },
    );
  }
}
