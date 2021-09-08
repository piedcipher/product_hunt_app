# product_hunt_app

Product Hunt App built using Product Hunt's API.

## Development Setup

- Clone this repo.
- Get dependencies via `flutter pub get`.
- Create a new application for using [Product Hunt's API](https://api.producthunt.com/v2/oauth/applications).
- After creating that, create a **Developer Token**. Option to create that is available on the same page.
- Open [api_key.dart](https://github.com/piedcipher/product_hunt_app/blob/master/lib/data/api/api_key.dart) and add the Developer Token:
```dart
/// dev token
const String token = 'bearer <PUT_DEVELOPER_TOKEN_HERE>';
```

## Getting Started

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
