import 'package:flutter/material.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/utils/constants/extensions/extensions.dart';
import '../../../core/utils/constants/svg_picture.dart';
import '/presentation/controllers/splash_screen_controller.dart';
import '/presentation/screens/splashScreen/widgets/logo_and_title.dart';
import 'widgets/alheekmah_and_loading.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: context.customOrientation(
            Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 48.0),
                    child: Opacity(
                      opacity: .4,
                      child: splash_icon_half_s(
                        height: MediaQuery.sizeOf(context).width * .4,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 56.0),
                      child:
                          sl<SplashScreenController>().ramadhanOrEidGreeting()),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: AlheekmahAndLoading(),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: LogoAndTitle(),
                ),
              ],
            ),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: LogoAndTitle(),
                      ),
                      Expanded(
                        flex: 4,
                        child: AlheekmahAndLoading(),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: sl<SplashScreenController>().ramadhanOrEidGreeting(),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: splash_icon_half_s(
                      height: MediaQuery.sizeOf(context).width * .25,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
