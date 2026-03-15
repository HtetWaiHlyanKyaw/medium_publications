import 'package:medium_publications/model/user.dart';

class RemoteDataSource {
  Future<User?> getUserFromServer() async {
    await Future.delayed(const Duration(seconds: 1));
    return User(
      name: 'Htet Wai Hlyan Kyaw',
      email: "htetwaihlyankyaw27@gmail.com",
    );
  }
}
