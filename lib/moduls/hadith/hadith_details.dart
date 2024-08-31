import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:islami/core/setting_provider.dart';
import 'package:islami/core/theme/application_theme.dart';
import 'package:islami/moduls/hadith/hadith_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
// import 'package:google_fonts/google_fonts.dart';

class HadithDetails extends StatelessWidget {
  static const String routeName = "HadithDetails";

  HadithDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    var provider = Provider.of<SettingProvider>(context);
    var theme = Theme.of(context);
    var data = ModalRoute.of(context)?.settings.arguments as HadithData;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.isDark()
                  ? "assets/images/home_dark_background.png"
                  : "assets/images/background.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            lang.islami,
            style: theme.textTheme.titleLarge,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              color: provider.isDark()
                  ? Color(0xFF141A2E)
                  : Color(0xFFF8F8F8).withOpacity(0.5),
              borderRadius: BorderRadius.circular(25)),
          margin: EdgeInsets.only(top: 120, bottom: 98, left: 29, right: 29),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${data.title}",
                    style: theme.textTheme.titleMedium?.copyWith(
                        color: provider.isDark()
                            ? ApplicationThemeData.primaryDarkColor
                            : Colors.black),
                  ),
                ],
              ),
              Divider(),
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      "${data.body}",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: provider.isDark()
                            ? ApplicationThemeData.primaryDarkColor
                            : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
