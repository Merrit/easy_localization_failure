import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'generated/locale_keys.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      fallbackLocale: const Locale('en'),
      path: 'translations',
      saveLocale: false,
      supportedLocales: const [
        Locale('de'),
        Locale('en'),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LocaleKeys.appName.tr()),
            Text(LocaleKeys.cancel.tr()),
            Text(LocaleKeys.completed.tr()),
            Text(LocaleKeys.confirm.tr()),
            Text(LocaleKeys.delete.tr()),
          ],
        ),
      ),
    );
  }
}
