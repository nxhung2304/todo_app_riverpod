.PHONY: build watch clean run

build:
	dart run build_runner build --delete-conflicting-outputs

watch:
	dart run build_runner watch --delete-conflicting-outputs

clean:
	dart run build_runner clean

run:
	fvm flutter run

dev:
	dart run build_runner watch --delete-conflicting-outputs &
	fvm flutter run
