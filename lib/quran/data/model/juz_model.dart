import 'package:equatable/equatable.dart';
import 'package:quran/quran/data/model/verses_model.dart';

class JuzModel extends Equatable {
  final int juz;
  final int juzStartSurahNumber;
  final dynamic juzEndSurahNumber;
  final String juzStartInfo;
  final String juzEndInfo;
  final int totalVerses;
  final List<VersesModel> verses;

  const JuzModel({
    required this.juz,
    required this.juzStartSurahNumber,
    required this.juzEndSurahNumber,
    required this.juzStartInfo,
    required this.juzEndInfo,
    required this.totalVerses,
    required this.verses,
  });

  factory JuzModel.fromJson(Map<String, dynamic> json) {
    return JuzModel(
      juz: json['juz'],
      juzStartSurahNumber: json['juzStartSurahNumber'],
      juzEndSurahNumber: json['juzEndSurahNumber'],
      juzStartInfo: json['juzStartInfo'],
      juzEndInfo: json['juzEndInfo'],
      totalVerses: json['totalVerses'],
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
  List<Object> get props => [];
}
