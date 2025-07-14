enum NavigationItem {
  home(0, '/home'),
  todo(1, '/todo'),
  search(2, '/search'),
  settings(3, '/settings');

  const NavigationItem(this.idx, this.route);

  final int idx;
  final String route;

  static NavigationItem fromRoute(String route) {
    if (route.startsWith('/todo')) return NavigationItem.todo;

    for (final item in NavigationItem.values) {
      if (item.route == route) return item;
    }
    return NavigationItem.home;
  }
}
