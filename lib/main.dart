import 'package:flutter/material.dart';
import 'package:islami/core/setting_provider.dart';
import 'package:islami/core/theme/application_theme.dart';
import 'package:islami/layout/layout_view.dart';
import 'package:islami/moduls/hadith/hadith_details.dart';
import 'package:islami/moduls/quran/quran_view.dart';
import 'package:islami/moduls/quran/widgets/sura_details.dart';
import 'package:islami/moduls/splash_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingProvider(), child: const IslamiApp()));
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return MaterialApp(
      locale: Locale(provider.currentLanguge),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ApplicationThemeData.lightTheme,
      darkTheme: ApplicationThemeData.darkTheme,
      themeMode: provider.currentThemeMode,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        LayOut.routeName: (context) => const LayOut(),
        // QuranView.routeName: (context) => const QuranView(),
        SuraDetails.routeName: (context) => const SuraDetails(),
        HadithDetails.routeName: (context) => HadithDetails(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
