# App Feature Guide
## Structure
```
features/app/
├── domain/                     # Business logic & contracts
│   ├── entities/
│   │   ├── user_profile.dart          # User data model
│   │   └── app_config.dart            # App settings model
│   └── repositories/
│       ├── user_repository.dart       # User data contract
│       └── config_repository.dart     # Settings contract
├── data/                       # Data implementation
│   ├── datasources/
│   │   ├── local_storage_datasource.dart    # Local DB/SharedPrefs
│   │   └── remote_config_datasource.dart    # API/Remote config
│   └── repositories/
│       ├── user_repository_impl.dart        # User data logic
│       └── config_repository_impl.dart      # Settings logic
└── presentation/               # UI layer
    ├── providers/              # State management
    │   ├── app_bar_controller_provider.dart   # AppBar state
    │   ├── theme_provider.dart                # Theme switching
    │   ├── user_session_provider.dart         # Login/logout
    │   ├── app_lifecycle_provider.dart        # App events
    │   └── notification_provider.dart         # Push notifications
    ├── models/                 # UI models
    │   ├── app_bar_state.dart                 # AppBar config
    │   ├── app_theme.dart                     # Theme config
    │   └── notification_state.dart            # Notification config
    ├── widgets/                # Reusable widgets
    │   ├── adaptive_app_bar.dart              # Smart AppBar
    │   ├── adaptive_bottom_navigation.dart    # Bottom nav
    │   ├── app_navigation.dart                # Main shell
    │   ├── loading_overlay.dart               # Loading spinner
    │   ├── error_dialog.dart                  # Error popup
    │   └── confirm_dialog.dart                # Confirm dialog
    ├── services/               # External integrations
    │   ├── notification_service.dart          # FCM/local notifications
    │   ├── analytics_service.dart             # Firebase Analytics
    │   └── storage_service.dart               # Local storage
    └── hooks/                  # Custom hooks
        ├── use_app_bar_config.dart           # AppBar setup
        ├── use_app_lifecycle.dart            # App state events
        └── use_connectivity.dart             # Network status
```

## When to use App Feature
### 1. Use for:
    - Cross-app functionality (navigation, theme, auth)
    - Infrastructure (storage, networking, analytics)
    - Global state (user session, app settings)
    - Shared UI (dialogs, loaders, error handling)

### 2. Don't use for:
    - Business-specific logic (todo CRUD, chat messages)
    - Feature-specific UI (todo list, profile form)
    - Domain models (Todo, Message, Product)

### 3. Common Examples:
    - Theme Management - Dark/light mode
    - User Authentication - Login/logout state
    - Push Notifications - FCM integration
    - Navigation - AppBar, bottom nav, routing
    - Error Handling - Global error boundary
    - Storage - SharedPreferences, local DB
    - Connectivity - Network status monitoring
