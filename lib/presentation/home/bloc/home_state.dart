part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    Failure? error,
  }) = _HomeState;

  factory HomeState.initial() => HomeState();
}
