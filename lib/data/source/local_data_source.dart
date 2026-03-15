import 'package:medium_publications/model/user.dart';

class LocalDataSource {
  // In-memory storage for demo purposes
  // In production, use local storage like Hive, SQFlite, etc.
  User? _cachedUser;

  Future<User?> getUserFromLocal() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _cachedUser;
  }

  Future<void> saveUserToLocal(User user) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _cachedUser = user;
  }
}
