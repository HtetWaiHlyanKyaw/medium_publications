import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:medium_publications/data/source/local_data_source.dart';
import 'package:medium_publications/data/source/remote_data_source.dart';
import 'package:medium_publications/model/user.dart';

class Repo {
  final RemoteDataSource remote = RemoteDataSource();
  final LocalDataSource local = LocalDataSource();
  final Connectivity _connectivity = Connectivity();

  Future<User?> getUser() async {
    // if connected, fetch from remote
    try {
      if (await isConnected()) {
        log('Fetching from remote');
        final user = await remote.getUserFromServer();

        // sync local storage with server
        if (user != null) {
          log('Saving to local storage');
          await local.saveUserToLocal(user);
          return user;
        } else {
          // server returned null, clear local storage
          log('Server returned null, clearing local storage');
          await local.clearUserFromLocal();
          return null;
        }
      }

      // if not connected, fetch from local
      log('Fetching from local storage');
      return await local.getUserFromLocal();
    } catch (e) {
      log('Error fetching user: ${e.toString()}');

      // if error occurs, fetch from local
      log('Falling back to local storage');
      try {
        return await local.getUserFromLocal();
      } catch (localError) {
        // if error occurs fetching from local, return null
        log('Error fetching from local storage: ${localError.toString()}');
        return null;
      }
    }
  }

  void log(String message) {
    // In production, use a proper logging library
    // ignore: avoid_print
    print('[Repo] $message');
  }

  Future<bool> isConnected() async {
    try {
      final connectivityResult = await _connectivity.checkConnectivity();
      final isOnline = !connectivityResult.contains(ConnectivityResult.none);
      log('Network status: ${isOnline ? "Online" : "Offline"}');
      return isOnline;
    } catch (e) {
      log('Error checking connectivity: ${e.toString()}');
      return false;
    }
  }
}
