import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gihub_search_user/domain/bloc/user_event.dart';
import 'package:gihub_search_user/domain/bloc/user_state.dart';
import 'package:gihub_search_user/models/user_model.dart';
import 'package:gihub_search_user/repositories/github_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(InitialUserState()) {
    on<SearchUserEvent>(_onSearchUser);
  }

  void _onSearchUser(SearchUserEvent event, Emitter<UserState> emit) async {
    final GitHubRepository repository = GitHubRepository();

    emit(LoadingUserState());

    try {
      final User user = await repository.getUserByName(event.username);
      emit(LoadedUserState(user: user));
    } catch (e) {
      emit(ErrorUserState(errorMessage: 'Failed to fetch user data'));
    }
  }
}
