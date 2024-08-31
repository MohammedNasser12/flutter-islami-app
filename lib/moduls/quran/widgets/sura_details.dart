import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/setting_provider.dart';
import 'package:islami/core/theme/application_theme.dart';
import 'package:islami/moduls/quran/widgets/sura_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "SuraDetails";
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    var theme = Theme.of(context);
    var data = ModalRoute.of(context)?.settings.arguments as SuraData;
    var provider = Provider.of<SettingProvider>(context);

    if (versesList.isEmpty) loadQuranDetails(data.number);
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
                    "${lang.theNameOfTheSurah} ${data.name}",
                    style: theme.textTheme.bodyMedium?.copyWith(
                        color: provider.isDark()
                            ? ApplicationThemeData.primaryDarkColor
                            : Colors.black),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.play_circle_fill_sharp,
                      color: provider.isDark()
                          ? ApplicationThemeData.primaryDarkColor
                          : Colors.black),
                ],
              ),
              Divider(),
              Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) => Text(
                  " {${index + 1}} ${versesList[index]}",
                  style: theme.textTheme.bodySmall?.copyWith(
                      color: provider.isDark()
                          ? ApplicationThemeData.primaryDarkColor
                          : Colors.black),
                  textAlign: TextAlign.center,
                ),
                itemCount: versesList.length,
              ))
            ],
          ),
        ),
      ),
    );
  }

  List<String> versesList = [];
  Future<void> loadQuranDetails(String suranumber) async {
    String content = await rootBundle.loadString("assets/sura/$suranumber.txt");
    versesList = content.split("\n");
    setState(() {});
  }
}
