import 'dart:convert';
import 'package:gihub_search_user/models/user_model.dart';
import 'package:gihub_search_user/helpers/helpers.dart';
import 'package:http/http.dart' as http;

class GitHubRepository {
  Future<User> getUserByName(String username) async {
    final response = await http.get(
      Uri.parse(Helpers.searchUser + username),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> userData = json.decode(response.body);
      return User.fromJson(userData);
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
