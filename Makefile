build_runner:
	flutter packages pub run build_runner watch --delete-conflicting-outputs
build-apks:
	flutter build apk --split-per-abi