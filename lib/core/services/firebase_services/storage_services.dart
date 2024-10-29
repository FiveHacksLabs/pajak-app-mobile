class StorageServices {
  static StorageServices? _instance;

  StorageServices._internal() {
    _instance = this;
  }

  factory StorageServices() => _instance ?? StorageServices._internal();
}
