import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_riverpod/core/config/router/app_routes.dart';
import 'package:learn_riverpod/shared/strings/shared_strings.dart';

class ErrorPage extends StatelessWidget {
  final String? message;
  final String? error;
  
  const ErrorPage({
    super.key,
    this.message,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(SharedStrings.errorTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red),
            SizedBox(height: 16),
            Text(
              message ?? SharedStrings.errorDefaultMessage,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            if (error != null) ...[
              SizedBox(height: 8),
              Text(
                error!,
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.login),
              child: Text(SharedStrings.errorBackToHome),
            ),
          ],
        ),
      ),
    );
  }
}
