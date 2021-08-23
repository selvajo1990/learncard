class Failure {
  final String errorMessage;

  Failure(this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}
