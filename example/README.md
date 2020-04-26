## Flutter Runtime Specs Used

Setup Flutter on dev machine
https://flutter.dev/

```
# check and install any missing necessary runtimes
flutter doctor
```

```
flutter --version
```

```
Flutter 1.12.13 • channel stable • https://github.com/flutter/flutter.git
Framework • revision cf37c2cd07 (4 weeks ago) • 2019-11-25 12:04:30 -0800
Engine • revision b6b54fd606
Tools • Dart 2.7.0
```

## Run Test

```
flutter test
```

## Build Android APK

```
flutter build apk
```

## Enable Web

```sh
flutter channel master
flutter upgrade
flutter config --enable-web
flutter create .
flutter devices
flutter run -d chrome
```

## Deploy Web

```sh
flutter build web
cd ./build/web
# requires surge access
surge
```

## View Web Version

https://flutter-101.surge.sh
