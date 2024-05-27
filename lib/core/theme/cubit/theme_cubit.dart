import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_project/core/theme/cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(LightThemeState());

  void toggleTheme() {
    emit(state is LightThemeState ? DarkThemeState() : LightThemeState());
  }
}
