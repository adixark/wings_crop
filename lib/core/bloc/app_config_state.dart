part of 'app_config_cubit.dart';

@freezed
class AppConfigState with _$AppConfigState {
  const factory AppConfigState({
    @Default(true) bool initial,
    @Default(true) bool isConnectedToInternet,
  }) = _AppConfigState;

  factory AppConfigState.initial() => AppConfigState();
}
