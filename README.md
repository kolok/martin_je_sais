# Martin je sais

A new Flutter project.

## Getting Started

FlutterFlow projects are built to run on the Flutter _stable_ release.

## Manage dependencies and compilations

### Upgrade Dart SDK

```sh
flutter upgrade
```

### Install dependencies

```sh
flutter pub get
```

### Build

```sh
flutter build appbundle --build-name <BUILD_NAME> --build-number <BUILD_NUMBER>
```

visit [Google play console](https://play.google.com/console/u/0/developers/5781389465303331311/app/4974790058993544722/releases/overview)

And publish a new release

Be careful to keep this config un your `android/app/build.grade` file :

```txt
android {
    …
   signingConfigs {
       release {
           keyAlias keystoreProperties['keyAlias']
           keyPassword keystoreProperties['keyPassword']
           storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
           storePassword keystoreProperties['storePassword']
       }
   }

    buildTypes {
        release {
           signingConfig signingConfigs.release
        }
    }
}
```

And keep the file `android/key.properties` with the signature
