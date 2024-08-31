import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/moduls/hadith/hadith_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadithView extends StatefulWidget {
  HadithView({super.key});

  @override
  State<HadithView> createState() => _HadithViewState();
}

class _HadithViewState extends State<HadithView> {
  List<HadithData> hadithDataList = [];

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    var theme = Theme.of(context);
    if (hadithDataList.isEmpty) loadHadithData();

    return Column(
      children: [
        Image.asset(
          "assets/images/hadith_header.png",
          scale: 4,
        ),
        Divider(),
        Text(
          lang.hadiths,
          style: theme.textTheme.titleMedium,
        ),
        Divider(),
        Expanded(
          child: ListView.builder(
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, HadithDetails.routeName,
                          arguments: HadithData(
                              title: hadithDataList[index].title,
                              body: hadithDataList[index].body));
                    },
                    child: Text(
                      " ${lang.hadith} ${index + 1}",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
              itemCount: hadithDataList.length),
        )
      ],
    );
  }

  Future<void> loadHadithData() async {
    String content = await rootBundle.loadString("assets/hadith/ahadeth.txt");
    List<String> allHadithDataList = content.split("#");

    for (int i = 0; i < allHadithDataList.length - 1; i++) {
      // print(allHadithDataList[i]);
      String singleHadith = allHadithDataList[i].trim();
      int indexLength = singleHadith.indexOf("\n");
      String hadithTitle = singleHadith.substring(0, indexLength);
      print(hadithTitle);
      String hadithBody = singleHadith.substring(indexLength + 1);
      print(hadithBody);
      HadithData hadithData = HadithData(title: hadithTitle, body: hadithBody);
      hadithDataList.add(hadithData);
      setState(() {});
    }
  }
}

class HadithData {
  final String title;
  final String body;

  HadithData({required this.title, required this.body});
}
