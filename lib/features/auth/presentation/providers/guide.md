# Guide for presentation/providers folder
## Purpose
- UI State Management: Handle component states, form states, loading states
- User Interaction Handling: Process user actions, events, gestures
- Business Logic + UI: Orchestrate data operations with UI updates
- Navigation Logic: Route management, page transitions
- Error Handling for UI: Display errors, validation messages
- State Transitions: Manage state changes that affect UI

## Naming Convention
### Class Naming Patterns:

- Main Feature State: [Feature]Notifier
    - Example: AuthNotifier → authNotifierProvider

- Form State: [Form]FormNotifier
    - Example: LoginFormNotifier → loginFormNotifierProvider

- List State: [Feature]ListNotifier
    - Example: TodoListNotifier → todoListNotifierProvider

- UI State: [Feature]UINotifier
    - Example: AuthUINotifier → authUINotifierProvider

### File Naming Convention
1. Main Logic: [feature]_provider.dart
- Contains: AuthNotifier (login, logout, session)
- Example: auth_provider.dart

2. Form State: [form_name]_form_provider.dart
    - Contains: LoginFormNotifier (form fields, validation)
    - Example: login_form_provider.dart

3. List Operations: [feature]_list_provider.dart
    - Contains: TodoListNotifier (CRUD, filtering)
    - Example: todo_list_provider.dart

4. UI State: [feature]_ui_provider.dart
    - Contains: AuthUINotifier (tabs, modals, visibility)
    - Example: auth_ui_provider.dart
