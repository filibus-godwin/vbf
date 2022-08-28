abstract class AppPath {
  const AppPath();
}

class _AppPathInfo {
  const _AppPathInfo(this.name);

  final String name;

  String get location => "/$name";
}

class UnknownPagePath extends AppPath {
  const UnknownPagePath();
  static const info = _AppPathInfo("/404");
}

class SplashPagePath extends AppPath {
  const SplashPagePath();
  static const info = _AppPathInfo("splash");
}
