class AuthServices {
  static AuthServices? _instance;

  AuthServices._internal() {
    _instance = this;
  }

  factory AuthServices() => _instance ?? AuthServices._internal();
}
