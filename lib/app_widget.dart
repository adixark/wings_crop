import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wings_crop/core/core.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () {
      getIt<AppConfigCubit>().initialize();
    });
    super.initState();
  }

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: const Locale("en"),
      title: 'Parasuite360',
      themeMode: ThemeMode.system,
      routerConfig: _appRouter.config(),
      builder: (context, child) {
        return BlocListener<AppConfigCubit, AppConfigState>(
          bloc: getIt<AppConfigCubit>(),
          listener: (context, state) {
            if (!state.isConnectedToInternet) {
              // Always show "No Internet Connection" when disconnected
            } else if (!state.initial) {
              // Show "Connected" only if it's NOT the initial state
            }
          },
          child: child ?? SizedBox.shrink(),
        );
      },
    );
  }
}
