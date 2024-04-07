import 'dart:developer';

import 'package:alquranalkareem/core/services/location/locations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '/core/services/languages/dependency_inj.dart' as dep;
import 'core/services/services_locator.dart';
import 'myApp.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  widgetsBinding;
  try {
    await LocationHelper.instance.getPositionDetails();
  } catch (e) {
    log(e.toString(), name: "Main", error: e);
  }
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Map<String, Map<String, String>> languages = await dep.init();
  initializeApp().then((_) {
    runApp(MyApp(
      languages: languages,
    ));
  });
}

Future<void> initializeApp() async {
  Future.delayed(const Duration(seconds: 0));
  await ServicesLocator().init();
  FlutterNativeSplash.remove();
}
