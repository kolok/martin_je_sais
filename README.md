# Martin je sais

This is a Flutter application build with FlutterFlow. It is a ChatGPT client to use with its own API key.

## Manage its own chatGPT API key

- Visit [OpenAI website](https://platform.openai.com/login?launch) and login
- Select API
- Credit some budget
- Create an API key

Here you are ! copy this API key to your App `Martin je sais`

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

### manage image launcher

The image launcher is here for `android`: [./assets/images/app_launcher_icon.png](./assets/images/app_launcher_icon.png)

To install and generate, just launch `flutter pub run flutter_launcher_icons`

Perhaps you'll have to remove the `web/manifest.json` file before build your app bundle

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
