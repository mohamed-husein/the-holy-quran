import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../../core/global/theme_color/theme_color_light.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/widgets/custom_text.dart';
import '../../business/home_cubit/quran_cubit.dart';
import '../screens/juz_details_screen.dart';
import '../screens/surah_details_screen.dart';

class GetBookmarkWidget extends StatelessWidget {
  const GetBookmarkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<QuranCubit>()..getBookmark(),
      child: BlocBuilder<QuranCubit, QuranState>(
        builder: (context, state) {
          QuranCubit quranCubit = QuranCubit.get(context);
          if (quranCubit.bookmark.isNotEmpty) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: quranCubit.bookmark.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    quranCubit.bookmark[index][AppConstants.columnSurah] == ''
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JuzDetailsScreen(
                                  juzNum: quranCubit.bookmark[index]
                                      [AppConstants.columnJuz],
                                      index:quranCubit.bookmark[index]
                                      [AppConstants.columnIndexAyah] ),
                            ),
                          )
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SurahDetailsScreen(
                                surahName: quranCubit.bookmark[index]
                                    [AppConstants.columnSurah],
                                surahNo: quranCubit.bookmark[index]
                                    [AppConstants.columnSurahNo],
                                index: quranCubit.bookmark[index]
                                    [AppConstants.columnIndexAyah],
                              ),
                            ),
                          );
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: ThemeColorLight.lightPurpleColor,
                      child: Center(
                        child: CustomText.titleMedium(
                          "${index + 1}",
                          context: context,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    title: CustomText.bodyMedium(
                      quranCubit.bookmark[index][AppConstants.columnSurah] == ''
                          ? "Juz' ${quranCubit.bookmark[index][AppConstants.columnJuz]}"
                          : quranCubit.bookmark[index]
                              [AppConstants.columnSurah],
                      context: context,
                      textAlign: TextAlign.start,
                    ),
                    subtitle: CustomText.labelSmall(
                      'AYAH ${quranCubit.bookmark[index][AppConstants.columnAyah]}',
                      context: context,
                      textAlign: TextAlign.start,
                    ),
                    trailing: InkWell(
                      onTap: () {
                        quranCubit.deleteBookmark(
                            quranCubit.bookmark[index][AppConstants.columnId]);
                      },
                      child: SvgPicture.asset(
                        AppAssets.delete,
                        color: ThemeColorLight.lightPurpleColor,
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (quranCubit.bookmark.isEmpty) {
            return Center(
              child:
                  CustomText.bodyLarge("No Bookmarks Added", context: context),
            );
          } else {
            return Center(
              child: Lottie.asset(AppAssets.loading, width: 500, height: 200),
            );
          }
        },
      ),
    );
  }
}
