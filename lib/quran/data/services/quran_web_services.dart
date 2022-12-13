import 'dart:convert';

import 'package:quran_app/core/error/exceptions.dart';
import 'package:quran_app/core/utils/api_constants.dart';
import 'package:quran_app/quran/data/model/juz_model.dart';
import 'package:quran_app/quran/data/model/surah_details_model.dart';
import 'package:quran_app/quran/data/model/surah_model.dart';
import 'package:http/http.dart' as http;

class QuranWebServices {
  Future<List<SurahModel>> getSurahData() async {
    http.Response response =
        await http.get(Uri.parse(ApiConstants.listOfSurahApi));

    if (response.statusCode == 200) {
      List data = (json.decode(response.body) as Map<String, dynamic>)['data'];
      return List<SurahModel>.from(
        data.map(
          (e) {
            return SurahModel.fromJson(e);
          },
        ),
      );
    } else {
      throw ServerException();
    }
  }

  Future<SurahDetailsModel> getSurahDetailsData(int surahNumber) async {
    http.Response response = await http.get(
      Uri.parse(
        ApiConstants.surahApi(surahNumber),
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          (json.decode(response.body) as Map<String, dynamic>)['data'];
      return SurahDetailsModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }

  Future<JuzModel> getAllJuz(int juzNum) async {
    http.Response response = await http.get(
      Uri.parse(
        ApiConstants.juzApi(juzNum),
      ),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          (json.decode(response.body) as Map<String, dynamic>)['data'];
      return JuzModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }
}
