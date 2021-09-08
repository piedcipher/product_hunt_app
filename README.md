# product_hunt_app

Product Hunt App built using Product Hunt's API.

## Development Setup

- Clone this repo.
- Get dependencies via `flutter pub get`.
- Create a [new application](https://api.producthunt.com/v2/oauth/applications) for using [Product Hunt's API](https://api.producthunt.com/v2/docs).
- After creating that, create a **Developer Token**. Option to create that is available on the same page.
- Open [api_key.dart](https://github.com/piedcipher/product_hunt_app/blob/master/lib/data/api/api_key.dart) and add the Developer Token:
```dart
/// dev token
const String token = 'bearer <PUT_DEVELOPER_TOKEN_HERE>';
```

## Features

- Browse today's posts in the Home Page.
- Today's posts are cached for offline viewing.
- Browse specific day's posts.
- View comments on any post.

## SDK

- :blue_heart: [Flutter](https://flutter.dev)

## Packages/Plugins

- [cupertino_icons](https://pub.dev/packages/cupertino_icons)
- [flutter](https://pub.dev/packages/flutter)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [internet_connection_checker](https://pub.dev/packages/internet_connection_checker)
- [intl](https://pub.dev/packages/intl)
- [json_annotation](https://pub.dev/packages/json_annotation)
- [path](https://pub.dev/packages/path)
- [path_provider](https://pub.dev/packages/path_provider)
- [retrofit](https://pub.dev/packages/retrofit)
- [build_runner](https://pub.dev/packages/build_runner)
- [flutter_test](https://pub.dev/packages/flutter_test)
- [json_serializable](https://pub.dev/packages/json_serializable)
- [retrofit_generator](https://pub.dev/packages/retrofit_generator)
- [very_good_analysis](https://pub.dev/packages/very_good_analysis)


## Getting Started

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
