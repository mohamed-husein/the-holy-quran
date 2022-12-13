import 'package:quran_app/core/error/exceptions.dart';
import 'package:quran_app/core/error/failure.dart';
import 'package:quran_app/core/utils/import_files.dart';
import 'package:quran_app/quran/data/model/database_model.dart';
import 'package:quran_app/quran/data/model/juz_model.dart';
import 'package:quran_app/quran/data/model/surah_model.dart';
import 'package:quran_app/quran/data/services/quran_local_services.dart';
import 'package:quran_app/quran/data/services/quran_web_services.dart';

import '../model/surah_details_model.dart';

class QuranRepository {
  final QuranWebServices quranWebServices;
  final QuranLocalServices quranLocalServices;

  QuranRepository({
    required this.quranWebServices,
    required this.quranLocalServices,
  });

  Future<Either<Failure, List<SurahModel>>> getSurahData() async {
    final result = await quranWebServices.getSurahData();
    try {
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, SurahDetailsModel>> getSurahDetailsData(
      int surahNumber) async {
    final result = await quranWebServices.getSurahDetailsData(surahNumber);
    try {
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, JuzModel>> getAllJuz(int juzNum) async {
    final result = await quranWebServices.getAllJuz(juzNum);
    try {
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, int>> insertBookmark(DatabaseModel db) async {
    final result = await quranLocalServices.insertBookmark(db);
    try {
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<Map<String, dynamic>>>> getBookmark() async {
    final result = await quranLocalServices.getBookmark();
    try {
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<Map<String, dynamic>>>> getLastRead() async {
    final result = await quranLocalServices.getLastRead();
    try {
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, int>> deleteBookmark(int id) async {
    final result = await quranLocalServices.deleteBookmark(id);
     try {
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
