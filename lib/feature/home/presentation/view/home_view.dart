import 'package:bloc_simple/feature/home/presentation/bloc/home_bloc.dart';
import 'package:bloc_simple/product/state/base/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/post_model.dart';

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
                return _ListTileWidget(post: post);
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

class _ListTileWidget extends StatelessWidget {
  const _ListTileWidget({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 170,
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(30)),
              color: Colors.blueGrey),
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: ListTile(
                        title: Text(
                          post.title ?? '',
                          maxLines: 1,
                        ),
                        subtitle: Text(
                          post.body ?? '',
                          maxLines: 1,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_right_alt)),
                    )
                  ],
                ),
              )),
              const Spacer()
            ],
          ),
        ),
        Positioned(
          right: 50,
          bottom: 15,
          child: SizedBox(
            height: 190,
            child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(topRight: Radius.circular(30)),
                child: Image.network(StringConstants.imageUrl)),
          ),
        ),
      ],
    );
  }
}
