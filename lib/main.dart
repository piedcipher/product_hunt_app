import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:product_hunt_app/core/bloc/bloc_observer.dart';
import 'package:product_hunt_app/core/navigation/routes.dart';
import 'package:product_hunt_app/data/api/api_client.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocsDir = await getApplicationDocumentsDirectory();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Bloc.observer = ProductHuntAppBlocObserver();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ApiClient>(
          create: (context) => ApiClient(Dio()),
        ),
        RepositoryProvider<Directory>(
          create: (context) => appDocsDir,
        )
      ],
      child: const MyApp(),
    ),
  );
}

/// This widget is the root of your application.
class MyApp extends StatelessWidget {
  /// Constructs root widget.
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Product Hunt App',
      initialRoute: Routes.homePage,
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
