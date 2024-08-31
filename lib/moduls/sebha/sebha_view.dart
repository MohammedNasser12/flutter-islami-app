import 'package:flutter/material.dart';
import 'package:islami/core/setting_provider.dart';
import 'package:islami/core/theme/application_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SebhaView extends StatefulWidget {
  SebhaView({super.key});

  @override
  State<SebhaView> createState() => _SebhaViewState();
}

class _SebhaViewState extends State<SebhaView> {
  List<String> azkar = ["سبحان الله", "الحمد لله", "الله اكبر"];

  int index = 0;

  int count = 0;

  double angle = 0;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    var provider = Provider.of<SettingProvider>(context);

    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 20,
        ),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              "assets/images/head of seb7a.png",
              scale: 4,
            ),
            InkWell(
              onTap: () {
                onZekrTab();

                // Transform.rotate(angle: angle);
                setState(() {});
              },
              child: Transform.rotate(
                angle: angle,
                child: Image.asset(
                  "assets/images/body of seb7a.png",
                  scale: 3,
                ),
              ),
            ),
          ],
        ),
        Text(
          lang.numberOfPraises,
          style: theme.textTheme.bodyMedium,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            decoration: BoxDecoration(
                color: provider.isDark()
                    ? Color(0xFF141A2E)
                    : Color(0xFFB7935F).withOpacity(.7),
                borderRadius: BorderRadius.circular(33)),
            padding: EdgeInsets.all(15),
            child: Text("$count ")),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            onZekrTab();
            setState(() {});
          },
          child: Container(
              decoration: BoxDecoration(
                  color: provider.isDark()
                      ? ApplicationThemeData.primaryDarkColor
                      : Color(0xFFB7935F),
                  borderRadius: BorderRadius.circular(33)),
              padding: EdgeInsets.all(15),
              child: Text(
                "${azkar[index]}",
                style: TextStyle(
                    color: provider.isDark() ? Colors.black : Colors.white),
              )),
        )
      ],
    );
  }

  onZekrTab() {
    if (count < 33) {
      angle = 0.30 + angle;

      count++;
    } else {
      count = 0;
      index++;
      if (index == 3) {
        index = 0;
        setState(() {});
      }
    }
  }
}
