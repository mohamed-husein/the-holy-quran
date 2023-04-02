import 'package:get_it/get_it.dart';
import 'shared_preferences_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../quran/business/home_cubit/quran_cubit.dart';
import '../../quran/data/repository/quran_repository.dart';
import '../../quran/data/services/quran_local_services.dart';
import '../../quran/data/services/quran_web_services.dart';

GetIt sl = GetIt.instance;

class DependencyInjectionServices {
  Future<void> init() async {
    // Web Services
    sl.registerLazySingleton<QuranWebServices>(() => QuranWebServices());

    // Local Services
    sl.registerLazySingleton<QuranLocalServices>(
        () => QuranLocalServices());

    // Repository
    sl.registerLazySingleton<QuranRepository>(
      () => QuranRepository(quranWebServices: sl(), quranLocalServices: sl()),
    );

    // Bloc
    sl.registerFactory<QuranCubit>(() => QuranCubit(quranRepository: sl()));

    await sharedPreferencesInit();

    // Shared Preferences
  }

  sharedPreferencesInit() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
    sl.registerLazySingleton<SharedPreferencesServices>(
        () => SharedPreferencesServicesImpl(prefs: sl()));
  }
}
