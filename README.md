# flutter base app

# uninstall app
adb uninstall com.quang.flutter_base_app

# GET SHA
cd android
./gradlew signingReport

#build file with custom file main
# Build API Test
flutter build apk -t lib/main_dev.dart --release
# Build API Product
flutter build apk -t lib/main_prod.dart --release

# build app Bundle upload appstore
flutter build apk -t lib/main_prod.dart --release

#change icon app
flutter pub get
flutter pub run flutter_launcher_icons -f pubspec.yaml
flutter pub get
flutter pub run flutter_launcher_icons

# Subsequent deployments
Update version name and version number in pubspec.yaml
Run flutter clean && flutter build appbundle --release
Go to Google Play Console -> Release Management -> Create new release
Upload new {project-root}/build/app/output/bundle/release/app-release.aab files
Checkin changes