import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../core/global/theme_color/theme_color_light.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/widgets/custom_text.dart';
import '../../business/home_cubit/quran_cubit.dart';
import '../../data/model/database_model.dart';
import '../../data/model/juz_model.dart';
import '../../data/model/surah_model.dart';
import '../../data/model/verses_model.dart';
import 'icon_widget.dart';


class GetJuzDetailsWidget extends StatelessWidget {
  const GetJuzDetailsWidget({super.key, required this.ayahIndex});
  final int ayahIndex;

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<QuranCubit, QuranState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        QuranCubit quranCubit = QuranCubit.get(context);
        if (quranCubit.getAllJuz == null) {
          return SizedBox(
            height: AppSizes.heightFullScreen - AppSizes.pH90,
            child: Center(
              child: Lottie.asset(AppAssets.loading, width: 500, height: 200),
            ),
          );
        }
        if (ayahIndex > 0) {
          quranCubit.controller.scrollToIndex(
            ayahIndex,
            preferPosition: AutoScrollPosition.begin,
          );
        }
        List<SurahModel> allSurahInJuz = [];
        List<SurahModel> rowAllSurahInJuz = [];

        String nameEnd = quranCubit.getAllJuz!.juzEndInfo.split(" - ").first;
        String nameStart =
            quranCubit.getAllJuz!.juzStartInfo.split(" - ").first;

        for (SurahModel item in quranCubit.surah) {
          rowAllSurahInJuz.add(item);
          if (item.surahNameEn == nameEnd) {
            break;
          }
        }

        for (SurahModel item in rowAllSurahInJuz.reversed.toList()) {
          allSurahInJuz.add(item);
          if (item.surahNameEn == nameStart) {
            break;
          }
        }

        int surahIndex = 0;
        return ListView(
          controller: quranCubit.controller,
         physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.pH20,
            horizontal: AppSizes.pW16,
          ),
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: quranCubit.getAllJuz!.verses.length,
              itemBuilder: (context, index) {
                JuzModel juzDetails = quranCubit.getAllJuz!;
                if (index != 0) {
                  if (juzDetails.verses[index].numberInSurah == 1) {
                    surahIndex++;
                  }
                }
                return AutoScrollTag(
                  controller: quranCubit.controller,
                  index: index,
                  key: ValueKey(index),
                  child: SizedBox(
                    width: AppSizes.widthFullScreen,
                    child: Column(
                      children: [
                        juzDetails.verses[index].numberInSurah == 1
                            ? SizedBox(
                                width: AppSizes.widthFullScreen,
                                child: Card(
                                  elevation: 5,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: AppSizes.pH8,
                                        horizontal: AppSizes.pW10),
                                    child: CustomText(
                                      allSurahInJuz.reversed
                                          .toList()[surahIndex]
                                          .name,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontFamily: AppFonts.fontFamilyKatib,
                                            height: 2,
                                          ),
                                      context: context,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox.fromSize(),
                        buildCardItem(
                          index: index,
                          juzDetails: juzDetails,
                          verses: juzDetails.verses[index],
                          context: context,
                          quranCubit: quranCubit,
                        ),
                        SizedBox(height: AppSizes.pH12),
                        SizedBox(
                          width: AppSizes.widthFullScreen - 30,
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: AppSizes.pW10),
                            child: CustomText(
                              juzDetails.verses[index].ayahArab,
                              textStyle:
                                  Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        fontFamily: AppFonts.fontFamilyKatib,
                                        height: 2,
                                      ),
                              context: context,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                        SizedBox(height: AppSizes.pH12),
                        SizedBox(
                          width: AppSizes.widthFullScreen - 30,
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: AppSizes.pW10),
                            child: CustomText.bodyMedium(
                              juzDetails.verses[index].ayahEn,
                              context: context,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        SizedBox(height: AppSizes.pH12),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildCardItem({
    required BuildContext context,
    required VersesModel verses,
    required int index,
    required JuzModel juzDetails,
    required QuranCubit quranCubit,
  }) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppSizes.pH8, horizontal: AppSizes.pW10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: AppSizes.pH40,
              width: AppSizes.pW40,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.octagonal),
                ),
              ),
              child: Center(
                child: CustomText.bodySmall(
                  verses.numberInSurah.toString(),
                  context: context,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              children: [
                IconWidget(onPressed: () {}, icon: AppAssets.share),
                verses.audioState == 'stop'
                    ? IconWidget(
                        onPressed: () {
                          quranCubit.playAudio(verses, context);
                        },
                        icon: AppAssets.play,
                      )
                    : Row(
                        children: [
                          if (verses.audioState == 'playing') ...[
                            IconWidget(
                                onPressed: () {
                                  quranCubit.pauseAudio(verses, context);
                                },
                                icon: AppAssets.pause)
                          ] else ...[
                            IconWidget(
                                onPressed: () {
                                  quranCubit.resumeAudio(verses, context);
                                },
                                icon: AppAssets.play)
                          ],
                          IconWidget(
                              onPressed: () {
                                quranCubit.stopAudio(verses);
                              },
                              icon: AppAssets.stop),
                        ],
                      ),
                IconWidget(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: CustomText.bodyMedium(
                              AppConstants.bookmark,
                              context: context,
                            ),
                            actions: [
                              Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        quranCubit.insertLastRead(
                                          DatabaseModel(
                                            id: verses.numberInQuran,
                                            surah: '',
                                            ayah: verses.numberInSurah,
                                            juz: verses.juz,
                                            surahNo: 1,
                                            via: verses.ayahArab,
                                            indexAyah: index,
                                            lastRead: 1,
                                          ),
                                        );
                                      },
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              AppSizes.br40,
                                            ),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          ThemeColorLight.lightPurpleColor,
                                        ),
                                      ),
                                      child: CustomText.titleMedium(
                                        AppConstants.lastRead,
                                        context: context,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        quranCubit.insertBookmark(
                                          DatabaseModel(
                                            id: verses.numberInQuran,
                                            surah: '',
                                            ayah: verses.numberInSurah,
                                            juz: verses.juz,
                                            surahNo: 1,
                                            via: verses.ayahArab,
                                            indexAyah: index,
                                            lastRead: 0,
                                          ),
                                          context,
                                        );
                                      },
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              AppSizes.br40,
                                            ),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          ThemeColorLight.lightPurpleColor,
                                        ),
                                      ),
                                      child: CustomText.titleMedium(
                                        AppConstants.bookmark,
                                        context: context,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: AppAssets.bookmark),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
