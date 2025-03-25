import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wings_crop/core/core.dart';

part 'failure.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  // General failures
  const factory Failure.info(
      {@Default("Something went wrong") String content}) = _Info;
  const factory Failure.alert(
      {@Default("Oops, Try again in sometime") String content}) = _Alert;
  const factory Failure.unexpected(
      {@Default("An unexpected error occurred") String content}) = _UnExpected;

  factory Failure.fromException(AppException err) {
    return Failure.unexpected(
      content: err.message,
    );
  }
}
