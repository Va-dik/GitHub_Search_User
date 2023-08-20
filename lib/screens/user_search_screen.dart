import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gihub_search_user/domain/bloc/user_bloc.dart';
import 'package:gihub_search_user/domain/bloc/user_state.dart';
import 'package:gihub_search_user/widgets/custom_card.dart';
import 'package:gihub_search_user/widgets/user_search_delegate.dart';

class UserSearchScreen extends StatelessWidget {
  const UserSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = UserBloc();

    return BlocProvider<UserBloc>(
      create: (context) => userBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 71, 71, 113),
          title: const Text('User search on GitHub'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: UserSearchDelegate(userBloc: userBloc),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is InitialUserState) {
              return const Center(
                child:
                    Text('Use the magnifying glass icon to search for a user'),
              );
            } else if (state is LoadingUserState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoadedUserState) {
              return CustomCard(user: state.user);
            } else if (state is ErrorUserState) {
              return Text(state.errorMessage);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
