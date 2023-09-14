import 'dart:io';

import 'package:flutter/material.dart';

class PlatformController extends ChangeNotifier {

  bool isAndroid = true;

  changePlatform() {

    isAndroid = !isAndroid;
    notifyListeners();
  }
}