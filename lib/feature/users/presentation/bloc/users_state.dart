part of 'users_bloc.dart';

final class UsersState extends Equatable {
  const UsersState({this.users, this.error});

  final List<UsersModel>? users;
  final String? error;

  UsersState copyWith({
    List<UsersModel>? users,
    String? error,
  }) {
    return UsersState(
      users: users ?? this.users,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [users, error];
}
