import 'package:flutter/material.dart';
import 'package:gihub_search_user/domain/bloc/user_bloc.dart';
import 'package:gihub_search_user/domain/bloc/user_event.dart';

class UserSearchDelegate extends SearchDelegate<String?> {
  final UserBloc userBloc;

  UserSearchDelegate({required this.userBloc});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      userBloc.add(SearchUserEvent(username: query));

      Future.delayed(Duration.zero, () => close(context, null));
    }
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}
