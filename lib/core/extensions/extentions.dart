import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wings_crop/core/core.dart';

extension AppConfigExtensions on BuildContext {
  AppConfigState get appConfig => read<AppConfigCubit>().state;
}
