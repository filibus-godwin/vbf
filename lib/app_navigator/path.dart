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
  static const info = _AppPathInfo("404");
}

class SplashPagePath extends AppPath {
  const SplashPagePath();
  static const info = _AppPathInfo("splash");
}

class LoginPagePath extends AppPath {
  const LoginPagePath();
  static const info = _AppPathInfo("login");
}

class SignupPagePath extends AppPath {
  const SignupPagePath();
  static const info = _AppPathInfo("signup");
}

class OtpPagePath extends AppPath {
  const OtpPagePath();
  static const info = _AppPathInfo("otp");
}

class HomePagePath extends AppPath {
  const HomePagePath();
  static const info = _AppPathInfo("home");
}
