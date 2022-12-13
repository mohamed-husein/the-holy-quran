import 'package:equatable/equatable.dart';

class PreBismillah extends Equatable {
  final String ayahAr;
  final String ayahEn;
  final String audio;

  const PreBismillah({
    required this.ayahAr,
    required this.ayahEn,
    required this.audio,
  });

  factory PreBismillah.formJson(Map<String, dynamic> json) {
    return PreBismillah(
        ayahAr    : json['text']['arab'] ?? 'Empty Value',
      ayahEn: json['translation']['en'] ?? 'Empty Value',
      audio: json['audio']['primary'] ?? 'Empty Value',
    );
  }
  
  @override
  List<Object> get props => [ayahAr,ayahAr,audio];
}
