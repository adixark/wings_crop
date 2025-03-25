import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wings_crop/core/injection/injection.dart';

part 'app_config_cubit.freezed.dart';
part 'app_config_state.dart';

@singleton
class AppConfigCubit extends Cubit<AppConfigState> {
  final SharedPreferences _prefs;
  final InternetConnection _internetConnection;

  AppConfigCubit()
      : _prefs = getIt<SharedPreferences>(),
        _internetConnection = getIt<InternetConnection>(),
        super(AppConfigState.initial());

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  bool _isFirstCheck = true; // Flag to prevent showing "Connected" initially
  late StreamSubscription<InternetStatus>? _subscription;

  void _setupConnectivityListener() {
    _subscription = _internetConnection.onStatusChange.listen(
      (InternetStatus status) {
        if (status == InternetStatus.connected) {
          if (!_isFirstCheck) {
            emit(state.copyWith(
              isConnectedToInternet: true,
              initial: false,
            ));
          }
        } else {
          emit(state.copyWith(
            isConnectedToInternet: false,
            initial: false,
          ));
        }
        _isFirstCheck = false; // Allow "Connected" after first check
      },
    );
  }

// Add to AppConfigCubit
  Future<void> initialize() async {
    _setupConnectivityListener();
  }
}
