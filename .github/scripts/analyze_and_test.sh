#!/bin/bash

IFS="," read -ra FILES <<< "$1"

for FILE in "${FILES[@]}"; do
  DIR=$(dirname "$FILE")
  echo "Analyzing $DIR"
  cd "$DIR"

  if [[ -f "pubspec.yaml" ]]; then
    flutter pub get
    dart pub get dart_code_metrics

    dirs_to_analyse=""
    if [ -d lib ]; then dirs_to_analyse+=" lib"; fi
    if [ -d test ]; then dirs_to_analyse+=" test"; fi
    if [ -d example ]; then dirs_to_analyse+=" example"; fi

    if [ dirs_to_analyse != "" ]; then
      dart run dart_code_metrics:metrics \
        analyze \
        $dirs_to_analyse \
        --fatal-warnings \
        --fatal-performance \
        --fatal-style \
        --disable-sunset-warning
      dart run dart_code_metrics:metrics \
        check-unused-files \
        $dirs_to_analyse \
        --fatal-unused \
        --disable-sunset-warning
      dart run dart_code_metrics:metrics \
        check-unused-code \
        $dirs_to_analyse \
        --fatal-unused \
        --disable-sunset-warning
    fi

    dart format . --set-exit-if-changed

    if [ -d test ]; then
        flutter test -r expanded
    else
        echo "Tests not found."
    fi
  fi

  cd -
done
