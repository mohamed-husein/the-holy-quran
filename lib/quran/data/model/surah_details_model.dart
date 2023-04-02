import 'package:equatable/equatable.dart';
import 'package:quran/quran/data/model/pre_bismillah.dart';
import 'package:quran/quran/data/model/verses_model.dart';

class SurahDetailsModel extends Equatable {
  final int number;
  final int numberOfVerses;
  final String surahName;
  final String surahNameEn;
  final String revelationArab;
  final String revelationEn;
  final String translationEn;
  final String tafserId;
  final PreBismillah? preBismillah;
  final List<VersesModel> verses;

  const SurahDetailsModel({
    required this.number,
    required this.numberOfVerses,
    required this.surahName,
    required this.surahNameEn,
    required this.revelationArab,
    required this.revelationEn,
    required this.tafserId,
    required this.translationEn,
    required this.preBismillah,
    required this.verses,
  });

  factory SurahDetailsModel.fromJson(Map<String, dynamic> json) {
    return SurahDetailsModel(
      number: json['number'],
      numberOfVerses: json['numberOfVerses'],
      surahName: json['name']['long'],
      surahNameEn: json['name']['transliteration']['id'],
      translationEn: json['name']['translation']['en'],
      revelationArab: json['revelation']['arab'],
      revelationEn: json['revelation']['en'],
      tafserId: json['tafsir']['id'],
      preBismillah: json['preBismillah'] == null ? null : PreBismillah.formJson(json['preBismillah']),
      verses: List<VersesModel>.from(
        json['verses'].map(
          (data) {
            return VersesModel.fromJson(data);
          },
        ),
      ),
    );
  }

  @override
  List<Object?> get props => [
        preBismillah,
        verses,
        number,
        numberOfVerses,
        surahName,
        surahNameEn,
        revelationArab,
        revelationEn,
        translationEn,
        tafserId,
      ];
}
