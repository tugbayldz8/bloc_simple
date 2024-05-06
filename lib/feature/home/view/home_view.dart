import 'package:bloc_simple/feature/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/post_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(FetchPostEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadedState) {
            return ListView.builder(
              itemCount: state.posts?.length,
              itemBuilder: (context, index) {
                Post? post = state.posts?[index];
                if (post == null) {
                  return Container();
                }
                return ListTile(
                  title: Text(post.title ?? ''),
                );
              },
            );
          } else if (state is HomeErrorState) {
            return Text(state.error ?? '');
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
