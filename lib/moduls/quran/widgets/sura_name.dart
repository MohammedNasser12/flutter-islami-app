import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/core/setting_provider.dart';
import 'package:islami/core/theme/application_theme.dart';
import 'package:provider/provider.dart';

class SuraName extends StatelessWidget {
  final SuraData data;

  SuraName({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    var provider = Provider.of<SettingProvider>(context);

    var theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            textAlign: TextAlign.center,
            data.number,
            style: theme.textTheme.bodyLarge?.copyWith(
                color: provider.isDark() ? Colors.white : Colors.black),
          ),
        ),
        SizedBox(height: 30, child: VerticalDivider()),
        Expanded(
          child: Text(
            textAlign: TextAlign.center,
            data.name,
            style: theme.textTheme.bodyLarge?.copyWith(
                color: provider.isDark() ? Colors.white : Colors.black),
          ),
        )
      ],
    );
  }
}

class SuraData {
  String name;
  String number;
  SuraData({required this.name, required this.number});
}
