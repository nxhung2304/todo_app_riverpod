# Todo App - Learning & Feature Checklist

## Basics (Done)
- [x] Setup Flutter project
- [x] Integrate Riverpod (state management)
- [x] Setup GoRouter (navigation)
- [x] Basic Todo CRUD UI (add, edit, delete)
- [x] Todo model with Freezed & JSON serialization
- [x] Persist todos to `SharedPreferences`
- [x] Google Sign-In using Firebase Auth

---

## Intermediate Features (Recommended)
- [ ] Store todos to Firestore (Cloud sync)
- [ ] Fetch todos per user (scoped by uid)
- [ ] Add `isDone`, `dueDate`, and `priority` to Todo model
- [ ] Sort/filter todos (by dueDate, priority)
- [ ] Add search bar
- [ ] Offline mode: sync local todos to cloud when online

---

## Advanced Features (Challenge Mode)
- [ ] Notifications for due todos (use `flutter_local_notifications`)
- [ ] Add subtasks to todos
- [ ] Add checklist (with progress %) inside a todo
- [ ] Create tag/category system
- [ ] Theme switcher (dark/light mode)
- [ ] Reorder todos (drag & drop)
- [ ] Animate UI with `flutter_animate`

---

## Architecture & Clean Code
- [ ] Create a `Repository` layer (`TodosRepository`)
- [ ] Split domain/data/presentation layers
- [ ] Use Riverpod `AsyncNotifier`, `Provider`, `StateNotifier` appropriately
- [ ] Add unit tests for core logic
- [ ] Write widget tests for Todo UI

---

## Extra Features
- [ ] Firebase Analytics (track user activity)
- [ ] In-app feedback form (Google Form or Firestore)
- [ ] App version check / force update prompt

