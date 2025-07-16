import 'package:learn_riverpod/features/auth/presentation/states/signup_form_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_form_provider.g.dart';

@riverpod
class SignupFormNotifier extends _$SignupFormNotifier {
  @override
  SignupFormState build() {
    return SignupFormState();
  }

  void updateFullName(String value) {
    state = state.copyWith(fullName: value);
  }

  void updateEmail(String value) {
    state = state.copyWith(email: value);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }

  void updateConfirmPassword(String value) {
    state = state.copyWith(confirmPassword: value);
  }

  bool get hasChanges {
    return state.fullName.isNotEmpty ||
        state.email.isNotEmpty ||
        state.password.isNotEmpty;
  }

  void reset() {
    state = const SignupFormState();
  }
}
