import 'package:flutter/material.dart';
import 'package:flutter_localisation_sample/language_notifier.dart';
import 'package:provider/provider.dart';

import 'l10n/l10n.dart';

// https://docs.flutter.dev/development/accessibility-and-localization/internationalization#tracking-the-locale-the-locale-class-and-the-localizations-widget
// https://api.flutter.dev/flutter/flutter_localizations/GlobalMaterialLocalizations-class.html
// https://pub.dev/packages/intl
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (buildContext) => LanguageNotifier(),
        child: Consumer<LanguageNotifier>(
          builder: (buildContext, localeNotifier, _) {
            return MaterialApp(
              title: 'Flutter Demo',
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: localeNotifier.locale,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: Builder(
                  builder: (context) =>
                      MyHomePage(title: context.l10n.app_title)),
            );
          },
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    context.l10n.hello;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              context.l10n.hello,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    Provider.of<LanguageNotifier>(context, listen: false)
                        .setLocal(const Locale("en"));
                  },
                  child: const Text("English"),
                ),
                TextButton(
                  onPressed: () {
                    Provider.of<LanguageNotifier>(context, listen: false)
                        .setLocal(const Locale("es"));
                  },
                  child: const Text("Spanish"),
                ),
                TextButton(
                  onPressed: () {
                    Provider.of<LanguageNotifier>(context, listen: false)
                        .setLocal(const Locale("ja"));
                  },
                  child: const Text("Japanese"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
