import 'package:dartz/dartz.dart';

import '../error/failure.dart';

typedef DefaultResponse<T> = Future<Either<Failure, T>>;
