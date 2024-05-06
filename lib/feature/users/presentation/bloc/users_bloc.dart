import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_simple/feature/users/model/index.dart';
import 'package:equatable/equatable.dart';
import '../../service/users_service.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  late final UsersService _usersService;
  UsersBloc(UsersService usersService)
      : _usersService = usersService,
        super(const UsersState()) {
    on<FetchUsersEvent>(_fetchUsers);
  }

  FutureOr<void> _fetchUsers(UsersEvent event, Emitter<UsersState> emit) async {
    final response = await _usersService.fetchUsers();
    if (response.error != null) {
      return emit(state.copyWith(error: state.error));
    }
    return emit(state.copyWith(users: response.data));
  }
}
