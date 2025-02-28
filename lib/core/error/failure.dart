import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({this.code, required super.message});
  final int? code;
  @override
  List<Object?> get props => [message, code];
}

class NoInternetFailure extends Failure {
  const NoInternetFailure() : super(message: 'No Internet Connection');
}

class LocalStorageFailure extends Failure {
  const LocalStorageFailure({required super.message});
  @override
  List<Object?> get props => [message];
}
