import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/quran_page/data/model/aya.dart';
import '../screens/quran_page/data/repository/aya_repository.dart';

class AyaController extends GetxController {
  final AyaRepository _ayaRepository = AyaRepository();
  final ScrollController scrollController = ScrollController();
  final searchTextEditing = TextEditingController();
  ContainerTransitionType transitionType = ContainerTransitionType.fade;

  var isLoading = false.obs;
  var ayahList = <Aya>[].obs;
  var surahList = <Aya>[].obs;
  var errorMessage = ''.obs;
  int currentPage = 1;
  int itemsPerPage = 5;
  bool hasMore = true;

  @override
  void onInit() {
    super.onInit();
    fetchAyahs();
    // scrollController.addListener(_onScroll);
  }

  @override
  void onClose() {
    // scrollController.dispose();
    super.onClose();
  }

  void search(String text) async {
    ayahList.clear();
    String convertedText = _convertArabicToEnglishNumbers(text);
    _setLoading(true);

    try {
      final List<Aya>? values = await _ayaRepository.search(convertedText);
      if (values != null && values.isNotEmpty) {
        ayahList.assignAll(values);
        _setLoading(false);
      } else {
        errorMessage.value = "No results found for $convertedText";
        _setLoading(false);
      }
    } catch (e) {
      errorMessage.value = e.toString();
      _setLoading(false);
    }
  }

  void surahSearch(String text) async {
    surahList.clear();
    _setLoading(true);
    String convertedText = _convertArabicToEnglishNumbers(text);
    try {
      final List<Aya>? values = await _ayaRepository.surahSearch(convertedText);
      if (values != null && values.isNotEmpty) {
        // Use a map to track unique Surahs
        var uniqueSurahs = <int, Aya>{};
        for (var aya in values) {
          if (!uniqueSurahs.containsKey(aya.surahNum)) {
            uniqueSurahs[aya.surahNum] = aya;
          }
        }
        surahList.assignAll(uniqueSurahs.values);
        _setLoading(false);
      } else {
        errorMessage.value = "No results found for $convertedText";
        _setLoading(false);
      }
    } catch (e) {
      errorMessage.value = e.toString();
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    isLoading.value = value;
  }

  // void _onScroll() {
  //   if (scrollController.position.maxScrollExtent ==
  //           scrollController.position.pixels &&
  //       hasMore) {
  //     fetchAyahs();
  //   }
  // }

  void fetchAyahs() {
    if (isLoading.isTrue || !hasMore) return;

    isLoading.value = true;
    final offset = (currentPage - 1) * itemsPerPage;

    _ayaRepository.fetchAyahsByPage(offset, itemsPerPage).then((newAyahs) {
      if (newAyahs.length < itemsPerPage) {
        hasMore = false; // No more items to add
      }

      ayahList.addAll(newAyahs);
      surahList.addAll(newAyahs);
      currentPage++;
      isLoading.value = false;
    }).catchError((error) {
      errorMessage.value = error.toString();
      isLoading.value = false;
    });
  }

  String _convertArabicToEnglishNumbers(String input) {
    const arabicNumbers = '٠١٢٣٤٥٦٧٨٩';
    const englishNumbers = '0123456789';

    return input.split('').map((char) {
      int index = arabicNumbers.indexOf(char);
      if (index != -1) {
        return englishNumbers[index];
      }
      return char;
    }).join('');
  }

  Map<int, int> indexMapping = {};
  String removeDiacritics(String input) {
    final diacriticsMap = {
      'أ': 'ا',
      'إ': 'ا',
      'آ': 'ا',
      'إٔ': 'ا',
      'إٕ': 'ا',
      'إٓ': 'ا',
      'أَ': 'ا',
      'إَ': 'ا',
      'آَ': 'ا',
      'إُ': 'ا',
      'إٌ': 'ا',
      'إً': 'ا',
      'ة': 'ه',
      'ً': '',
      'ٌ': '',
      'ٍ': '',
      'َ': '',
      'ُ': '',
      'ِ': '',
      'ّ': '',
      'ْ': '',
      'ـ': '',
      'ٰ': '',
      'ٖ': '',
      'ٗ': '',
      'ٕ': '',
      'ٓ': '',
      'ۖ': '',
      'ۗ': '',
      'ۘ': '',
      'ۙ': '',
      'ۚ': '',
      'ۛ': '',
      'ۜ': '',
      '۝': '',
      '۞': '',
      '۟': '',
      '۠': '',
      'ۡ': '',
      'ۢ': '',
    };

    StringBuffer buffer = StringBuffer();
    Map<int, int> indexMapping =
        {}; // Ensure indexMapping is declared if not already globally declared
    for (int i = 0; i < input.length; i++) {
      String char = input[i];
      String? mappedChar = diacriticsMap[char];
      if (mappedChar != null) {
        buffer.write(mappedChar);
        if (mappedChar.isNotEmpty) {
          indexMapping[buffer.length - 1] = i;
        }
      } else {
        buffer.write(char);
        indexMapping[buffer.length - 1] = i;
      }
    }
    return buffer.toString();
  }

  List<TextSpan> highlightLine(String line) {
    List<TextSpan> spans = [];
    int start = 0;

    String lineWithoutDiacritics = removeDiacritics(line);
    String searchTermWithoutDiacritics =
        removeDiacritics(searchTextEditing.text);

    while (start < lineWithoutDiacritics.length) {
      final startIndex =
          lineWithoutDiacritics.indexOf(searchTermWithoutDiacritics, start);
      if (startIndex == -1) {
        spans.add(TextSpan(
            text: line.substring(start))); // Modified to use start directly.
        break;
      }

      if (startIndex > start) {
        spans.add(TextSpan(
            text: line.substring(
                start, startIndex))); // Simplified by removing indexMapping.
      }

      int endIndex = startIndex + searchTermWithoutDiacritics.length;
      endIndex = endIndex <= line.length ? endIndex : line.length;

      spans.add(TextSpan(
        text: line.substring(startIndex, endIndex),
        style: const TextStyle(
            color: Color(0xffa24308), fontWeight: FontWeight.bold),
      ));

      start = endIndex; // Move past the end of the current match.
    }
    return spans;
  }
}
