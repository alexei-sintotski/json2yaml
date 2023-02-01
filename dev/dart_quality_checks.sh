#!/bin/bash -ex

dart example/main.dart
dart analyze --fatal-infos .
dart run test
dart run dependency_validator
dev/format_dart_code.sh --set-exit-if-changed
dart pub publish --dry-run
