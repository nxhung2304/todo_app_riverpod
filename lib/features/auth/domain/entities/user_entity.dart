class UserEntity {
  final String id;
  final String email;
  final String? displayName;
  final String? photoURL;
  final bool isEmailVerified;
  final DateTime createdAt;
  final DateTime? lastLoginAt;

  const UserEntity({
    required this.id,
    required this.email,
    this.displayName,
    this.photoURL,
    required this.isEmailVerified,
    required this.createdAt,
    this.lastLoginAt,
  });

  bool get hasCompletedProfile => displayName != null && displayName!.isNotEmpty;

  bool get needsEmailVerification => !isEmailVerified;
  
  String get displayText => displayName ?? email.split('@').first;
}
