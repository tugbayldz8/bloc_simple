import 'package:bloc_simple/feature/users/presentation/bloc/users_bloc.dart';
import 'package:bloc_simple/feature/users/service/users_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/users_model.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersBloc(UsersService())..add(FetchUsersEvent()),
      child: const Scaffold(
        body: _GridViewBuilder(),
      ),
    );
  }
}

class _GridViewBuilder extends StatelessWidget {
  const _GridViewBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        if (state.error != null) return Text(state.error!);
        if (state.users != null) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                itemCount: state.users?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  UsersModel? users = state.users![index];
                  return Column(
                    children: [
                      Text(users.name ?? ''),
                      Text(users.username ?? ''),
                      Text(users.phone ?? ''),
                    ],
                  );
                }),
          );
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
