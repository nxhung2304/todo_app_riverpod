import 'package:learn_riverpod/features/todo/presentation/states/settings_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_controller.g.dart';

@riverpod
class SettingsController extends _$SettingsController {
  @override
  SettingsState build() {
    return SettingsState();
  }

  void updateLanguage(String language) {
    state = state.copyWith(language: language);
  }

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }
}
