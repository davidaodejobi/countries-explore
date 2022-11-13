import 'package:explore/modules/home/view_model/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'l10n/l10n.dart';
import 'locator.dart';
import 'core/utils/theme.dart';
import 'modules/home/home.dart';
import 'modules/home/view_model/locale_provider.dart';

void main() {
  setup();
  runApp(const Explore());
}

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppTheme>(create: (_) => AppTheme()),
        ChangeNotifierProvider<LocaleProvider>(create: (_) => LocaleProvider()),
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
      ],
      child: Consumer2<AppTheme, LocaleProvider>(
        builder: (context, theme, locale, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Explore',
            darkTheme: AppTheme.dark(),
            theme: AppTheme.light(),
            themeMode: theme.currentTheme,
            locale: locale.locale,
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              // AppLocalizations.delegate,
              // GlobalMaterialLocalizations.delegate,
              // GlobalWidgetsLocalizations.delegate,
              // GlobalCupertinoLocalizations.delegate,
            ],
            home: const Home(),
          );
        },
      ),
    );
  }
}
