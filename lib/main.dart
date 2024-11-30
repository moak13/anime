import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'app/app.dart';
import 'utils/graphql_client.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  _initSystemUI();
  runApp(GraphQLProvider(
    client: client,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AniList',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffCC3838),
        ),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}

void _initSystemUI() {
  // Configure preferred orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Configure status bar appearance
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // Only honored in Android. Ensure dark icons/texts on the status bar along
    // with transparent status bar background
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    // Only honored in iOS. Ensure dark icons and texts on the status bar
    statusBarBrightness: Brightness.light,
  ));
}
