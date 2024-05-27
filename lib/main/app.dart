import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_project/core/routes/route_config.dart';
import 'package:flutter_demo_project/core/theme/app_theme.dart';
import 'package:flutter_demo_project/core/theme/cubit/theme_cubit.dart';
import 'package:flutter_demo_project/core/theme/cubit/theme_state.dart';

class App extends StatelessWidget with AppTheme {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
            darkTheme: darkTheme(),
            routerConfig: RouteConfig().goRouter,
            themeMode:
                state is LightThemeState ? ThemeMode.light : ThemeMode.dark,
          );
        },
      ),
    );
  }
}
