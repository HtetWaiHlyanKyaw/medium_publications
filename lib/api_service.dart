class ApiService {
  String? _session;

  ApiService._internal();

  static final ApiService _instance = ApiService._internal();

  static ApiService get instance => _instance;

  Future<bool> authenticate() async {
    await Future.delayed(const Duration(seconds: 1));
    _session = 'your_session';
    return true;
  }

  bool get isAuthenticated => _session != null;

  Future<bool> logout() async {
    await Future.delayed(const Duration(seconds: 1));
    _session = null;
    return true;
  }
}
