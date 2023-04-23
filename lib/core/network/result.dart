import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.failure({required String error}) = Failure<T>;
  const factory Result.success(T data) = Success<T>;
}

abstract class Error {}
