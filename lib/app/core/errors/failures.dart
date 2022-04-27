abstract class Failure {
  ///Abstract class to define a failure, if the
  ///subclasses have some properties, they`ll get passed to this
  ///constructor so that Equatable can perform value comparison
  const Failure([this.properties = const <dynamic>[]]);

  final List properties;
  @override
  List<Object?> get props => properties;
}

class ServerFailure extends Failure {
  ///When the response status is different than 200
  const ServerFailure(this.statusCode) : super();

  final int statusCode;
  @override
  List<Object> get properties => [statusCode];
}

class NetworkFailure extends Failure {
  ///When the app can't connect to the server
  const NetworkFailure();
}

class TimeOutFailure extends Failure {
  ///When the server is slow to respond
  const TimeOutFailure();
}

class InvalidCredentials extends Failure {
  ///When the server is slow to respond
  const InvalidCredentials();
}

class AnotherFailure extends Failure {
  ///When an unknown exception occurs
  const AnotherFailure();
}
