import 'dart:async';

import 'package:error_handler/presentation/util/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }

  _startDelay() {
    _timer =
        Timer(const Duration(milliseconds: 800), _goNext);
  }

  _goNext() async {
    Navigator.pushReplacementNamed(context, Routes.homeRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
