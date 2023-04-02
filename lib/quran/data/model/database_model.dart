import 'package:equatable/equatable.dart';

import '../../../core/utils/app_constants.dart';

class DatabaseModel extends Equatable {
  final String surah;
  final int ayah;
  final int juz;
  final int surahNo;
  final String via;
  final int indexAyah;
  final int lastRead;
  final int? id;

  const DatabaseModel({
    this.id,
    required this.surah,
    required this.ayah,
    required this.juz,
    required this.surahNo,
    required this.via,
    required this.indexAyah,
    required this.lastRead,
  });

  factory DatabaseModel.fromJson(Map<String, dynamic> json) {
    return DatabaseModel(
      surah: json[AppConstants.columnSurah],
      ayah: json[AppConstants.columnAyah],
      juz: json[AppConstants.columnJuz],
      via: json[AppConstants.columnVia],
      surahNo: json[AppConstants.columnSurahNo],
      indexAyah: json[AppConstants.columnIndexAyah],
      lastRead: json[AppConstants.columnLastRead],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      AppConstants.columnId: id,
      AppConstants.columnSurah: surah,
      AppConstants.columnAyah: ayah,
      AppConstants.columnJuz: juz,
      AppConstants.columnVia: via,
      AppConstants.columnIndexAyah: indexAyah,
      AppConstants.columnLastRead: lastRead,
      AppConstants.columnSurahNo: surahNo,
    };
  }

  @override
  List<Object?> get props => [id, surah, juz, via, ayah, indexAyah, lastRead,surahNo];
}
