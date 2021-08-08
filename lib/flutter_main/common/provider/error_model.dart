class ErrorModel {
  ErrorModel._internal();

  static final ErrorModel _instance = ErrorModel._internal();

  factory ErrorModel() {
    return _instance;
  }

  logError({String tag, String message}) {
    print("ErrorModel / $tag  ----> $message");
  }
}
