import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:magic_dropdown/magic_dropdown.dart';
import 'package:animated_menu/animated_menu.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:islami/core/setting_provider.dart';
import 'package:islami/core/theme/application_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  List<String> languge = ["English", "Arabic"];
  List<String> themeMode = ["Light", "Dark"];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context);
    var provider = Provider.of<SettingProvider>(context);
    var lang = AppLocalizations.of(context)!;
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      SizedBox(
        height: 40,
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          lang.languge,
          style:
              theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
          // textAlign: TextAlign.left,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: CustomDropdown<String>(
          decoration: CustomDropdownDecoration(
            closedFillColor: provider.isDark()
                ? Color(0xFF141A2E)
                : ApplicationThemeData.primaryColor,
            expandedFillColor: provider.isDark()
                ? Color(0xFF141A2E)
                : ApplicationThemeData.primaryColor,
          ),
          hintText: 'Select Languge',
          items: languge,
          initialItem:
              provider.currentLanguge == "en" ? languge[0] : languge[1],
          onChanged: (value) {
            if (value == "English") {
              provider.changeCurrentLanguge("en");
            }
            if (value == "Arabic") {
              provider.changeCurrentLanguge("ar");
            }
            log('changing value to: $value');
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          lang.theme,
          style:
              theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
          // textAlign: TextAlign.left,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: CustomDropdown<String>(
          decoration: CustomDropdownDecoration(
            closedFillColor: provider.isDark()
                ? Color(0xFF141A2E)
                : ApplicationThemeData.primaryColor,
            expandedFillColor: provider.isDark()
                ? Color(0xFF141A2E)
                : ApplicationThemeData.primaryColor,
          ),
          hintText: 'Select Theme Mode',
          items: themeMode,
          initialItem: provider.currentThemeMode == "Light"
              ? themeMode[0]
              : themeMode[1],
          onChanged: (value) {
            if (value == "Light") {
              provider.changeCurrentThemeMode(ThemeMode.light);
            }
            if (value == "Dark") {
              provider.changeCurrentThemeMode(ThemeMode.dark);
            }
            log('changing value to: $value');
          },
        ),
      ),
    ]);
  }
}


// Padding(
    //   padding: const EdgeInsets.all(15),
    //   child: Column(
    //     children: [
    //       Text(
    //         "Setting",
    //         style: theme.textTheme.bodyMedium,
    //         textAlign: TextAlign.center,
    //       ),
    //       Text(
    //         "Language",
    //         style: theme.textTheme.titleMedium,
    //       ),
    //       Text(
    //         "Theme",
    //         style: theme.textTheme.titleMedium,
    //       ),
    //       // MagicDropdown(["Light,Dark"]),
    //     ],
    //   ),
    // );