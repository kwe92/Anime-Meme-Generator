import 'package:anime_meme_generator/app/themes/app_theme.dart';
import 'package:anime_meme_generator/features/memes/ui/memes_view.dart';
import 'package:anime_meme_generator/features/shared/services/get_it.dart';
import 'package:flutter/material.dart';

void main() {
  // initializing services (Initializing Service Locator in App)

  //   - GetIt services are initialized in your main function
  //     prior to your application starting

  setUp();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: appTheme,
        home: const MemesView(),
      );
}
