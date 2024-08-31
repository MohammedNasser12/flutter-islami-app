import 'package:flutter/material.dart';
import 'package:islami/core/setting_provider.dart';
import 'package:islami/core/theme/application_theme.dart';
import 'package:islami/moduls/hadith/hadith_view.dart';
import 'package:islami/moduls/quran/quran_view.dart';
import 'package:islami/moduls/radio/radio_view.dart';
import 'package:islami/moduls/sebha/sebha_view.dart';
import 'package:islami/moduls/settings/settings_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LayOut extends StatefulWidget {
  static const String routeName = "layout";

  const LayOut({super.key});

  @override
  State<LayOut> createState() => _LayOutState();
}

class _LayOutState extends State<LayOut> {
  int selectedindex = 0;
  List<Widget> screens = [
    RadioView(),
    SebhaView(),
    HadithView(),
    QuranView(),
    SettingView()
  ];

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    var provider = Provider.of<SettingProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.getBackGroundImage()),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios_new,
              color: provider.isDark()
                  ? ApplicationThemeData.primaryDarkColor
                  : Colors.black),
          title: Text(
            lang.islami,
          ),
        ),
        body: screens[selectedindex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/radio.png")),
                label: lang.radio),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/sebha-1.png")),
                label: lang.sebha),
            BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage("assets/icons/quran-quran-svgrepo-com.png")),
                label: lang.hadiths),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/quran.png")),
                label: lang.quran),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: lang.setting),
          ],
          currentIndex: selectedindex,
          onTap: (index) {
            selectedindex = index;

            setState(() {});
          },
        ),
      ),
    );
  }
}
