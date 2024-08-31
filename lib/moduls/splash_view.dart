import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/core/setting_provider.dart';
import 'package:islami/layout/layout_view.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushNamed(context, LayOut.routeName);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Image.asset(
      provider.getSplashScreenImage(),
      fit: BoxFit.cover,
    );
  }
}
