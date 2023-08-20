class User {
  final String login;
  final String avatarUrl;
  final String createdAt;

  const User({
    required this.login,
    required this.avatarUrl,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    String convertDateFormat(String inputDate) {
      DateTime dateTime = DateTime.parse(inputDate);
      String formattedDate =
          "${dateTime.day}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.year}";
      return formattedDate;
    }

    return User(
      login: json['login'],
      avatarUrl: json['avatar_url'],
      createdAt: convertDateFormat(json['created_at']),
    );
  }
}
