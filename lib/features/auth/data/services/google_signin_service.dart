import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninService {
  static const List<String> scopes = <String>['email', 'profile'];

  Future<void> init() async {
    try {
      final GoogleSignIn signIn = GoogleSignIn.instance;

      await signIn.initialize();

      signIn.authenticationEvents
          .listen(_handleAuthenticationEvent)
          .onError(_handleAuthenticationError);

      await signIn.attemptLightweightAuthentication();
    } catch (error) {
      print('🚨 Init Error: $error');
    }
  }

  Future<GoogleSignInAccount?> signIn() async {
    try {
      final GoogleSignIn signIn = GoogleSignIn.instance;

      if (signIn.supportsAuthenticate()) {
        final account = await signIn.authenticate();
        return account;
      } else {
        print('❌ Platform does not support authenticate()');
        return null;
      }
    } catch (error) {
      print('🚨 Sign-In Error: $error');
      return null;
    }
  }

  Future<void> _handleAuthenticationEvent(
    GoogleSignInAuthenticationEvent event,
  ) async {
    print("_handleAuthenticationEvent: event = $event");
    final GoogleSignInAccount? user = switch (event) {
      GoogleSignInAuthenticationEventSignIn() => event.user,
      GoogleSignInAuthenticationEventSignOut() => null,
    };

    if (user != null) {
      print('✅ User signed in: ${user.email}');

      final GoogleSignInClientAuthorization? authorization = await user
          .authorizationClient
          .authorizationForScopes(scopes);

      if (authorization != null) {
        print('✅ User already authorized required scopes');
        print('Access Token: ${authorization.accessToken}');
      } else {
        print('⚠️ Need to request authorization for scopes');
        // Request authorization when needed
        await _requestAuthorization(user);
      }
    } else {
      print('❌ User signed out');
    }
  }

  Future<void> _requestAuthorization(GoogleSignInAccount user) async {
    try {
      final GoogleSignInClientAuthorization authorization = await user
          .authorizationClient
          .authorizeScopes(scopes);

      print('✅ Authorization granted');
      print('Access Token: ${authorization.accessToken}');
    } catch (error) {
      print('🚨 Authorization Error: $error');
    }
  }

  Future<void> _handleAuthenticationError(Object error) async {
    print('🚨 Authentication Error: $error');
  }

  Future<void> signOut() async {
    try {
      await GoogleSignIn.instance.signOut();
      print('✅ Signed out successfully');
    } catch (error) {
      print('🚨 Sign out error: $error');
    }
  }
}
