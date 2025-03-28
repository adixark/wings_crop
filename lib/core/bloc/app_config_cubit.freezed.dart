// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppConfigState {
  bool get initial => throw _privateConstructorUsedError;
  bool get isConnectedToInternet => throw _privateConstructorUsedError;

  /// Create a copy of AppConfigState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppConfigStateCopyWith<AppConfigState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigStateCopyWith<$Res> {
  factory $AppConfigStateCopyWith(
          AppConfigState value, $Res Function(AppConfigState) then) =
      _$AppConfigStateCopyWithImpl<$Res, AppConfigState>;
  @useResult
  $Res call({bool initial, bool isConnectedToInternet});
}

/// @nodoc
class _$AppConfigStateCopyWithImpl<$Res, $Val extends AppConfigState>
    implements $AppConfigStateCopyWith<$Res> {
  _$AppConfigStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppConfigState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initial = null,
    Object? isConnectedToInternet = null,
  }) {
    return _then(_value.copyWith(
      initial: null == initial
          ? _value.initial
          : initial // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnectedToInternet: null == isConnectedToInternet
          ? _value.isConnectedToInternet
          : isConnectedToInternet // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppConfigStateImplCopyWith<$Res>
    implements $AppConfigStateCopyWith<$Res> {
  factory _$$AppConfigStateImplCopyWith(_$AppConfigStateImpl value,
          $Res Function(_$AppConfigStateImpl) then) =
      __$$AppConfigStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool initial, bool isConnectedToInternet});
}

/// @nodoc
class __$$AppConfigStateImplCopyWithImpl<$Res>
    extends _$AppConfigStateCopyWithImpl<$Res, _$AppConfigStateImpl>
    implements _$$AppConfigStateImplCopyWith<$Res> {
  __$$AppConfigStateImplCopyWithImpl(
      _$AppConfigStateImpl _value, $Res Function(_$AppConfigStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppConfigState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initial = null,
    Object? isConnectedToInternet = null,
  }) {
    return _then(_$AppConfigStateImpl(
      initial: null == initial
          ? _value.initial
          : initial // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnectedToInternet: null == isConnectedToInternet
          ? _value.isConnectedToInternet
          : isConnectedToInternet // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AppConfigStateImpl implements _AppConfigState {
  const _$AppConfigStateImpl(
      {this.initial = true, this.isConnectedToInternet = true});

  @override
  @JsonKey()
  final bool initial;
  @override
  @JsonKey()
  final bool isConnectedToInternet;

  @override
  String toString() {
    return 'AppConfigState(initial: $initial, isConnectedToInternet: $isConnectedToInternet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigStateImpl &&
            (identical(other.initial, initial) || other.initial == initial) &&
            (identical(other.isConnectedToInternet, isConnectedToInternet) ||
                other.isConnectedToInternet == isConnectedToInternet));
  }

  @override
  int get hashCode => Object.hash(runtimeType, initial, isConnectedToInternet);

  /// Create a copy of AppConfigState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigStateImplCopyWith<_$AppConfigStateImpl> get copyWith =>
      __$$AppConfigStateImplCopyWithImpl<_$AppConfigStateImpl>(
          this, _$identity);
}

abstract class _AppConfigState implements AppConfigState {
  const factory _AppConfigState(
      {final bool initial,
      final bool isConnectedToInternet}) = _$AppConfigStateImpl;

  @override
  bool get initial;
  @override
  bool get isConnectedToInternet;

  /// Create a copy of AppConfigState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppConfigStateImplCopyWith<_$AppConfigStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
