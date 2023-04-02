import 'package:equatable/equatable.dart';

class SurahModel extends Equatable {
  final int number;
  final int numberOfVerses;
  final String surahName;
  final String name;
  final String surahNameEn;
  final String revelationArab;
  final String revelationEn;
  final String translationEn;
  final String tafserId;

  const SurahModel({
    required this.number,
    required this.name,
    required this.numberOfVerses,
    required this.surahName,
    required this.surahNameEn,
    required this.revelationArab,
    required this.revelationEn,
    required this.tafserId,
    required this.translationEn,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      number: json['number'],
      numberOfVerses: json['numberOfVerses'],
      surahName: json['name']['short'],
      name: json['name']['long'],
      surahNameEn: json['name']['transliteration']['id'],
      revelationArab: json['revelation']['arab'],
      revelationEn: json['revelation']['en'],
      translationEn: json['name']['translation']['en'],
      tafserId: json['tafsir']['id'],
    );
  }
  @override
  List<Object> get props => [
        number,
        numberOfVerses,
        surahName,
        surahNameEn,
        revelationArab,
        revelationEn,
        tafserId,
        name,
        translationEn,
      ];
}
