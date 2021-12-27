/// Backend environments.
enum Environment { dev, prod }

/// The current environment.
///
/// Usage: `flutter run --dart-define=ENV=prod`. Defaults to `dev`.
final kEnv = Environment.values.byName(
  const String.fromEnvironment('ENV', defaultValue: 'dev'),
);

extension EnvironmentValues on Environment {
  /// The URI of the backend API.
  Uri get uri {
    switch (this) {
      case Environment.dev:
        return Uri.parse('http://localhost:8000');
      case Environment.prod:
        return Uri.parse('https://example.com');
    }
  }
}
