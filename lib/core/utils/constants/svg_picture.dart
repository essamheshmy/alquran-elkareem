import 'package:alquranalkareem/core/utils/constants/extensions/surah_name_with_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../presentation/controllers/bookmarks_controller.dart';
import '../../../presentation/controllers/general_controller.dart';
import '../../../presentation/controllers/surah_audio_controller.dart';
import '../../services/services_locator.dart';

Widget besmAllah() {
  return SvgPicture.asset(
    'assets/svg/besmAllah.svg',
    width: sl<GeneralController>().ifBigScreenSize(100.0.w, 150.0.w),
    colorFilter:
        ColorFilter.mode(Get.theme.cardColor.withOpacity(.8), BlendMode.srcIn),
  );
}

Widget besmAllah2() {
  return SvgPicture.asset(
    'assets/svg/besmAllah2.svg',
    width: sl<GeneralController>().ifBigScreenSize(100.0.w, 150.0.w),
    colorFilter:
        ColorFilter.mode(Get.theme.cardColor.withOpacity(.8), BlendMode.srcIn),
  );
}

Widget spaceLine(double height, width) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: SvgPicture.asset(
      'assets/svg/space_line.svg',
      height: height,
      width: width,
    ),
  );
}

Widget bookmarkIcon({double? height, double? width, int? pageNum}) {
  return Obx(() {
    return Semantics(
      button: true,
      enabled: true,
      label: 'Add Bookmark',
      child: SvgPicture.asset(
        sl<BookmarksController>().isPageBookmarked(
                pageNum ?? sl<GeneralController>().currentPageNumber.value)
            ? 'assets/svg/bookmarked.svg'
            : Get.context!.bookmarkPageIcon(),
        width: width,
        height: height,
      ),
    );
  });
}

Widget bookmarkPageIcon({double? height, double? width, int? pageNum}) {
  return SvgPicture.asset(
    sl<BookmarksController>().isPageBookmarked(
            pageNum ?? sl<GeneralController>().currentPageNumber.value)
        ? 'assets/svg/bookmarked.svg'
        : Get.context!.bookmarkPageIcon(),
    width: width,
    height: height,
  );
}

Widget surahName(double height, double width) {
  return SvgPicture.asset(
    'assets/svg/surah_name/00${sl<SurahAudioController>().surahNum}.svg',
    colorFilter:
        ColorFilter.mode(Get.theme.colorScheme.primary, BlendMode.srcIn),
    width: width,
    height: height,
  );
}

Widget decorations(BuildContext context, {double? height, double? width}) {
  return Opacity(
    opacity: .6,
    child: SvgPicture.asset(
      'assets/svg/decorations.svg',
      width: width,
      height: height ?? 60,
    ),
  );
}

Widget button_curve({double? height, double? width, Color? color}) {
  return SvgPicture.asset(
    'assets/svg/button_curve.svg',
    width: width,
    height: height ?? 60,
    colorFilter: ColorFilter.mode(
        color ?? Get.theme.colorScheme.primary, BlendMode.srcIn),
  );
}

Widget menu_curve({double? height, double? width, Color? color}) {
  return SvgPicture.asset(
    'assets/svg/menu_curve.svg',
    width: width,
    height: height ?? 60,
    colorFilter: ColorFilter.mode(
        color ?? Get.theme.colorScheme.primary.withOpacity(.7),
        BlendMode.srcIn),
  );
}

Widget options({double? height, double? width, Color? color}) {
  return SvgPicture.asset(
    'assets/svg/options.svg',
    width: width,
    height: height ?? 60,
    colorFilter: ColorFilter.mode(
        color ?? Get.theme.colorScheme.secondary, BlendMode.srcIn),
  );
}

Widget home({double? height, double? width, Color? color}) {
  return SvgPicture.asset(
    'assets/svg/home.svg',
    width: width,
    height: height ?? 60,
    colorFilter: ColorFilter.mode(
        color ?? Get.theme.colorScheme.secondary, BlendMode.srcIn),
  );
}

Widget quran_ic_s({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/quran_ic_s.svg',
    width: width,
    height: height ?? 60,
  );
}

Widget splash_icon_half_s({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/splash_icon_half_s.svg',
    width: width,
    height: height ?? 60,
  );
}

Widget slider_ic2({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/slider_ic2.svg',
    width: width,
    height: height ?? 60,
  );
}

Widget font_size({double? height, double? width, Color? color}) {
  return Transform.translate(
    offset: const Offset(0, -5),
    child: SvgPicture.asset(
      'assets/svg/font_size.svg',
      width: width,
      height: height ?? 35,
      colorFilter: ColorFilter.mode(
          color ?? Get.theme.colorScheme.secondary, BlendMode.srcIn),
    ),
  );
}

Widget splash_icon({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/splash_icon.svg',
    width: width,
    height: height ?? 60,
  );
}

Widget splash_icon_s({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/splash_icon_s.svg',
    width: width,
    height: height ?? 60,
  );
}

Widget play_arrow({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/play-arrow.svg',
    width: width,
    height: height ?? 60,
  );
}

Widget rewind_arrow({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/rewind.svg',
    width: width,
    height: height ?? 60,
  );
}

Widget backward_arrow({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/backward.svg',
    width: width,
    height: height ?? 60,
  );
}

Widget pause_arrow({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/pause_arrow.svg',
    width: width,
    height: height ?? 60,
  );
}

Widget playlist({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/playlist.svg',
    width: width,
    height: height ?? 60,
  );
}

Widget tafsir_icon({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/tafsir_icon.svg',
    width: width,
    height: height ?? 60,
  );
}

Widget bookmark_icon({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/bookmark_icon.svg',
    width: width,
    height: height ?? 60,
  );
}

Widget bookmark_icon2({double? height, double? width, Color? color}) {
  return SvgPicture.asset(
    'assets/svg/bookmark_icon2.svg',
    width: width,
    height: height ?? 60,
  );
}

Widget copy_icon({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/copy_icon.svg',
    width: width,
    height: height ?? 60,
  );
}

Widget share_icon({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/share_icon.svg',
    width: width,
    height: height ?? 60,
  );
}

Widget tafseer_icon({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/tafseer.svg',
    width: width,
    height: height ?? 60,
  );
}

Widget surah_banner1({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/surah_banner1.svg',
    width: width,
    height: height,
  );
}

Widget surah_banner2({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/surah_banner2.svg',
    width: width,
    height: height,
  );
}

Widget surah_banner4({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/surah_banner4.svg',
    width: width,
    height: height,
  );
}

Widget surah_ayah_banner1({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/surah_banner_ayah1.svg',
    width: width,
    height: height ?? 35,
  );
}

Widget surah_ayah_banner2({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/surah_banner_ayah2.svg',
    width: width,
    height: height ?? 35,
  );
}

Widget surah_ayah_banner4({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/surah_banner4.svg',
    width: width,
    height: height ?? 35,
  );
}

Widget surah_banner3({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/surah_banner3.svg',
    width: width,
    height: height,
  );
}

Widget sajda_icon({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/sajda_icon.svg',
    width: width,
    height: height ?? 35,
  );
}

Widget bookmark_list({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/bookmark_list.svg',
    width: width,
    height: height ?? 35,
  );
}

Widget list_icon({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/list_icon.svg',
    width: width,
    height: height ?? 35,
  );
}

Widget search_icon({double? height, double? width}) {
  return SvgPicture.asset(
    'assets/svg/search_icon.svg',
    width: width,
    height: height ?? 35,
  );
}

Widget alheekmah_logo({double? height, double? width, Color? color}) {
  return SvgPicture.asset(
    'assets/svg/alheekmah_logo.svg',
    width: width,
    height: height ?? 35,
    colorFilter: ColorFilter.mode(
        color ?? Get.theme.colorScheme.secondary, BlendMode.srcIn),
  );
}

Widget customSvg(String path, {double? height, double? width, Color? color}) {
  return SvgPicture.asset(
    path,
    width: width,
    height: height,
    colorFilter: ColorFilter.mode(
        color ?? Get.theme.colorScheme.secondary, BlendMode.srcIn),
  );
}
