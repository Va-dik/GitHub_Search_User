abstract class UserEvent {}

class SearchUserEvent extends UserEvent {
  final String username;

  SearchUserEvent({required this.username});
}
