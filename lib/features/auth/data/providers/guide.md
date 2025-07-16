# Guide for data/providers folder
## Purpose
- Singleton Management: Reuse instances, save memmory
- Dependency Injection & Testability: Easy mocking and testing
- Lifecycle Management: Auth dispose when unused
- Configuration & Environment: Setup by env (dev/stag/prod)
- Lazy Loading: Create when needed, don't load all at start app
- Dependency Graph Management: Riverpod auto resolves dependencies

## What to put here
### 1. DataSource Providers
```
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
```
@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository(
    localDataSource: ref.read(authLocalDataSourceProvider),
    remoteDataSource: ref.read(authRemoteDataSourceProvider),
  );
}
```

### 3. Service Providers (Business Logic)
```
@riverpod
AuthService authService(Ref ref) {
  return AuthService(
    repository: ref.read(authRepositoryProvider),
  );
}

```

### 4. Configuration & Setup
```
@riverpod
DatabaseService databaseService(Ref ref) {
  final config = ref.read(appConfigProvider);
  return DatabaseService(
    connectionString: config.dbUrl,
  );
}
```
