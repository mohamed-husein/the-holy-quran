import 'package:equatable/equatable.dart';

class VersesModel extends Equatable {
  final int numberInSurah;
  final int numberInQuran;
  final int juz;
  final String ayahArab;
  final String ayahEn;
  final String audio;
  final String tafser;
  String audioState;

   VersesModel({
    required this.numberInSurah,
    required this.juz,
    required this.numberInQuran,
    required this.ayahArab,
    required this.ayahEn,
    required this.audio,
    required this.tafser,
    this.audioState ='stop',
  });

  factory VersesModel.fromJson(Map<String, dynamic> json) {
    return VersesModel(
      numberInSurah: json['number']['inSurah'],
      numberInQuran: json['number']['inQuran'],
      juz: json['meta']['juz'],
      ayahArab: json['text']['arab'],
      ayahEn: json['translation']['en'],
      audio: json['audio']['primary'],
      tafser: json['tafsir']['id']['short'],
    );
  }
  @override
  List<Object> get props => [numberInSurah,juz,ayahArab,ayahEn,audio,tafser,audioState];
}
