build_runner:
	flutter packages pub run build_runner watch --delete-conflicting-outputs
build-apks:
	flutter build apk --split-per-abi --dart-define-from-file=.env
gen-l10n:
	flutter gen-l10n
build-web:
	flutter build web --base-href="/project_movie_flutter/" --dart-define-from-file=.env --web-renderer auto -o ./docs

run-web:
	flutter run -d chrome --dart-define-from-file=.env --web-renderer auto

