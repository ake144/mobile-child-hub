class Failures {
  final String message;

  Failures({this.message = "An error occurred"});

  @override
  String toString() => "Failure: $message";
}