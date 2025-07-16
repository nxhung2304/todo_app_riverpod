import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_form_state.freezed.dart';

@freezed
sealed class SignupFormState with _$SignupFormState {
  const factory SignupFormState({
    @Default('') String fullName,
    @Default('') String email,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default(false) bool isLoading,
    @Default(false) bool obscurePassword,
    @Default(false) bool obscureConfirmPassword,
  }) = _SignupFormState;

  const SignupFormState._();

  bool get hasChanges {
    return fullName.isNotEmpty ||
        email.isNotEmpty ||
        password.isNotEmpty ||
        confirmPassword.isNotEmpty;
  }

  bool get passwordsMatch => password == confirmPassword;
}
