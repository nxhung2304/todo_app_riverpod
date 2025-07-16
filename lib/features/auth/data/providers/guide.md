# Guide for data/providers folder

## Purpose
- **Singleton Management**: Reuse instances, save memory
- **Dependency Injection & Testability**: Easy mocking and testing
- **Lifecycle Management**: Auto dispose when unused
- **Configuration & Environment**: Setup by environment (dev/staging/prod)
- **Lazy Loading**: Create when needed, don't load all at app start
- **Dependency Graph Management**: Riverpod auto resolves dependencies

## What to put here

### 1. DataSource Providers
**Lợi ích**: Shared instances, dễ swap giữa local/remote, testable
```dart
@riverpod
AuthLocalDataSource authLocalDataSource(Ref ref) {
  return AuthLocalDataSource(
    storageService: ref.read(storageServiceProvider),
  );
}

@riverpod  
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  return AuthRemoteDataSource(
    httpClient: ref.read(httpClientProvider),
  );
}
```

### 2. Repository Providers
**Lợi ích**: Business logic tập trung, dễ thay đổi data source strategy
```dart
@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository(
    localDataSource: ref.read(authLocalDataSourceProvider),
    remoteDataSource: ref.read(authRemoteDataSourceProvider),
  );
}
```

### 3. Service Providers (Business Logic)
**Lợi ích**: Complex business logic, orchestration giữa nhiều repositories
```dart
@riverpod
AuthService authService(Ref ref) {
  return AuthService(
    repository: ref.read(authRepositoryProvider),
  );
}
```

### 4. Configuration & Setup
**Lợi ích**: Environment-specific setup, centralized config management
```dart
@riverpod
DatabaseService databaseService(Ref ref) {
  final config = ref.read(appConfigProvider);
  return DatabaseService(
    connectionString: config.dbUrl,
  );
}
```

## What NOT to put here

### ❌ UI State Management
```dart
// ❌ Thuộc về presentation/providers
@riverpod
class LoginFormNotifier extends _$LoginFormNotifier {
  // Form state, loading states, user interactions
}
```

### ❌ UI-specific Logic
```dart
// ❌ Thuộc về presentation/providers  
@riverpod
bool isSubmitButtonEnabled(Ref ref) {
  // UI validation logic
}
```

## Naming Convention

**Function Naming Patterns:**

- **DataSource Providers**: `[feature][Type]DataSource`
  - Example: `authLocalDataSource` → `authLocalDataSourceProvider`
  - Example: `authRemoteDataSource` → `authRemoteDataSourceProvider`
- **Repository Providers**: `[feature]Repository`
  - Example: `authRepository` → `authRepositoryProvider`
  - Example: `todoRepository` → `todoRepositoryProvider`
- **Service Providers**: `[feature]Service`
  - Example: `authService` → `authServiceProvider`
  - Example: `notificationService` → `notificationServiceProvider`
- **Infrastructure Providers**: `[service]Service`
  - Example: `storageService` → `storageServiceProvider`
  - Example: `networkService` → `networkServiceProvider`

## File Naming Convention

**File Structure Patterns:**

- **All-in-one**: `[feature]_data_providers.dart`
  - Contains: All data layer providers for a feature
  - Example: `auth_data_providers.dart`
  - Use when: Feature has 2-4 providers
- **DataSource Only**: `[feature]_datasource_providers.dart`
  - Contains: DataSource providers only
  - Example: `auth_datasource_providers.dart`
  - Use when: Many datasources (5+ providers)
- **Repository Only**: `[feature]_repository_providers.dart`
  - Contains: Repository and Service providers
  - Example: `auth_repository_providers.dart`
  - Use when: Complex business logic layer
- **Infrastructure**: `infrastructure_providers.dart`
  - Contains: Core services (Storage, Network, Database)
  - Example: `infrastructure_providers.dart`
  - Use when: App-wide infrastructure setup

## Remember
- **Data providers** = Create "tools" (instances)
- **Presentation providers** = Use "tools" (state management)
- Focus on **what to create**, not **how UI behaves**
- **All functions use camelCase** for consistency
- **Generated providers** automatically add "Provider" suffix
