build_runner:
	flutter packages pub run build_runner watch --delete-conflicting-outputs
build-apks:
	flutter build apk --split-per-abi
gen-l10n:
	flutter gen-l10n
build-web:
	flutter build web --web-renderer html -o ./docs