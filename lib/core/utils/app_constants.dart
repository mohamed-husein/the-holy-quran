class AppConstants {
  /// Replace English And Arabic Number
  static const List<String> english = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9'
  ];
  static const List<String> farsi = [
    '۰',
    '۱',
    '۲',
    '۳',
    '٤',
    '۵',
    '٦',
    '۷',
    '۸',
    '۹'
  ];
  static const List<String> juzName = [
    'آلم',
    'سَيَقُولُ',
    'تِلْكَ ٱلرُّسُلُ',
    'لَن تَنَالُوا۟ ٱلْبِرَّ',
    'وَٱلْمُحْصَنَـٰتُ',
    'لَّا يُحِبُّ ٱللَّهُ',
    'وَإِذَا سَمِعُوا	',
    'وَلَوْ أَنَّنَا	',
    'قَالَ ٱلْمَلَأُ	',
    'وَٱعْلَمُواْ',
    'يَعْتَذِرُونَ',
    'وَمَا مِنْ دَآبَّةٍ	',
    'وَمَا أُبَرِّئُ	',
    'رُبَمَا',
    'سُبْحَانَ ٱلَّذِى	',
    'قَالَ أَلَمْ	',
    'ٱقْتَرَبَ لِلْنَّاسِ	',
    'قَدْ أَفْلَحَ	',
    'وَقَالَ ٱلَّذِينَ',
    'أَمَّنْ خَلَقَ	',
    'أُتْلُ مَاأُوْحِیَ',
    'وَمَنْ يَّقْنُتْ',
    'وَمَآ لي',
    'فَمَنْ أَظْلَمُ',
    'إِلَيْهِ يُرَدُّ',
    'حم',
    'قَالَ فَمَا خَطْبُكُم	',
    'قَدْ سَمِعَ ٱللهُ	',
    'تَبَارَكَ ٱلَّذِى	',
    'عَمَّ'
  ];

  static const List<String> juzNameEn = [
    'Alif Lam Meem',
    'Sayaqool',
    'Tilkal Rusul',
    'Lan Tana Loo',
    'Wal Mohsanat',
    'La Yuhibbullah',
    'Wa Iza Samiu',
    'Wa Lau Annana',
    'Qalal Malao',
    "Wa A'lamu	",
    'Yatazeroon	',
    "Wa Mamin Da'abat	",
    'Wa Ma Ubrioo	',
    'Rubama',
    'Subhanallazi',
    'Qal Alam	',
    'Aqtarabo',
    'Qadd Aflaha	',
    'Wa Qalallazina	',
    "A'man Khalaq	",
    'Utlu Ma Oohi	',
    'Wa Manyaqnut	',
    'Wa Mali	',
    'Faman Azlam	',
    'Elahe Yuruddo	',
    "Ha'a Meem	",
    'Qala Fama Khatbukum	',
    'Qadd Sami Allah	',
    'Tabarakallazi	',
    "Amma Yatasa'aloon	",
  ];

  static const String bismillaah = 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ';
  static const String ayah = 'In the name of Allah, the Entirely Merciful, the Especially Merciful.';

  /// Strings

  static const String appTitle = 'The Holy Qur\'an';
  static const String appBody = 'Learn Qur\'an and Recite once everyay';
  static const String getStart = 'Get Started';
  static const String salamuAlaikum = 'Assalamualaikum';
  static const String lastRead = 'Last Read';
  static const String surah = 'Surah';
  static const String juz = 'Juz';
  static const String bookmark = 'Bookmark';
  static String ayahNo(int ayahNo) => 'Ayah No : $ayahNo';
  static const String serverFailure = 'Server Failure';
  static const String unExpectedFailure = 'UnExpected Failure';
  static const String themeKey = 'THEME_KEY';
  static const String dBName = 'QuranDatabase';
  static const String dBTableName = 'bookmark';
  static const String columnId = 'id';
  static const String columnSurah = 'surah';
  static const String columnAyah = 'ayah';
  static const String columnSurahNo = 'surah_number';
  static const String columnJuz = 'juz';
  static const String columnVia = 'via';
  static const String columnIndexAyah = 'index_ayah';
  static const String columnLastRead = 'last_read';


}
