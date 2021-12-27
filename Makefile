.PHONY: models
models:
	flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: dev
dev:
	flutter build appbundle
	flutter build ios

.PHONY: prod
prod:
	flutter build appbundle --dart-define=ENV=prod
	flutter build ios --dart-define=ENV=prod