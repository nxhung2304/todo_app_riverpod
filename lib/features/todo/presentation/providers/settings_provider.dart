import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_provider.g.dart';

class SettingsState {
  final bool isDarkMode;
  final String language;

  const SettingsState({this.isDarkMode = false, this.language = 'vi'});

  SettingsState copyWith({bool? isDarkMode, String? language}) {
    return SettingsState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      language: language ?? this.language,
    );
  }
}

@riverpod
class SettingsProvider extends _$SettingsProvider {
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
