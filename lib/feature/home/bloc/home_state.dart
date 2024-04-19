part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedState extends HomeState {
  HomeLoadedState(this.posts);
  final List<Post>? posts;
}

final class HomeErrorState extends HomeState {
  HomeErrorState(this.error);
  final String? error;
}
