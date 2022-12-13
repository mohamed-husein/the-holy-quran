class ApiConstants {
  /// Quran Api
  static const String baseUrl = 'https://api.quran.gading.dev';
  static const String listOfSurahApi = '$baseUrl/surah';
  static String surahApi(int surahNumber) => '$baseUrl/surah/$surahNumber';
  static String juzApi(int juzNumber) => '$baseUrl/juz/$juzNumber';

}
