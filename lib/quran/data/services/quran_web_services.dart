import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/error/exceptions.dart';
import '../../../core/utils/api_constants.dart';
import '../model/juz_model.dart';
import '../model/surah_details_model.dart';
import '../model/surah_model.dart';

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
