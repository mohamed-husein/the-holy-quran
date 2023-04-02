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
import '../../data/model/surah_details_model.dart';
import '../../data/model/verses_model.dart';
import 'icon_widget.dart';

class GetAyatsWidget extends StatelessWidget {
  const GetAyatsWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        QuranCubit quranCubit = QuranCubit.get(context);
        if (quranCubit.surahDetailsModel == null) {
          return Center(
            child: Lottie.asset(AppAssets.loading, width: 500, height: 200),
          );
        }
        if (index > 1) {
          quranCubit.controller.scrollToIndex(
            index ,
            preferPosition: AutoScrollPosition.begin,
          );
        }
        return ListView(
          controller: quranCubit.controller,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.pH20,
            horizontal: AppSizes.pW16,
          ),
          children: [
            AutoScrollTag(
              controller: quranCubit.controller,
              index: 0,
              key: const ValueKey(0),
              child: Padding(
                padding: EdgeInsets.only(bottom: AppSizes.pW10),
                child: buildSurahDetailsCard(
                    context: context,
                    surahDetails: quranCubit.surahDetailsModel!),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: quranCubit.surahDetailsModel!.verses.length,
              itemBuilder: (context, index) {
                SurahDetailsModel surahDetails = quranCubit.surahDetailsModel!;
                return SizedBox(
                  width: AppSizes.widthFullScreen,
                  child: AutoScrollTag(
                    controller: quranCubit.controller,
                    index: index + 1,
                    key: ValueKey(index + 1),
                    child: Column(
                      children: [
                        buildCardItem(
                          quranCubit: quranCubit,
                          verses: surahDetails.verses[index],
                          context: context,
                          index: index,
                          surahDetails: surahDetails,
                        ),
                        SizedBox(height: AppSizes.pH12),
                        SizedBox(
                          width: AppSizes.widthFullScreen - 30,
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: AppSizes.pW10),
                            child: CustomText(
                              surahDetails.verses[index].ayahArab,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
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
                              surahDetails.verses[index].ayahEn,
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
    required SurahDetailsModel surahDetails,
    required QuranCubit quranCubit,
    required int index,
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
                                          surah: surahDetails.surahNameEn,
                                          ayah: verses.numberInSurah,
                                          juz: verses.juz,
                                          surahNo: surahDetails.number,
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
                                          surah: surahDetails.surahNameEn,
                                          ayah: verses.numberInSurah,
                                          juz: verses.juz,
                                          surahNo: surahDetails.number,
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
                  icon: AppAssets.bookmark,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSurahDetailsCard({
    required BuildContext context,
    required SurahDetailsModel surahDetails,
  }) {
    return Container(
      width: AppSizes.widthFullScreen,
      decoration: BoxDecoration(
        color: ThemeColorLight.lightPurpleColor,
        borderRadius: BorderRadius.circular(AppSizes.br10),
        image: const DecorationImage(
          image: AssetImage(AppAssets.mushafImage),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: AppSizes.pH10,
          ),
          CustomText.titleLarge(surahDetails.surahNameEn, context: context),
          SizedBox(
            height: AppSizes.pH10,
          ),
          CustomText.titleMedium(surahDetails.translationEn, context: context),
          Container(
            margin: EdgeInsets.symmetric(vertical: AppSizes.pH14),
            height: 1,
            width: AppSizes.pW188,
            color: ThemeColorLight.white,
          ),
          CustomText.titleSmall(
              '${surahDetails.numberOfVerses} AYAT | ${surahDetails.revelationEn.toUpperCase()}',
              context: context),
          SizedBox(
            height: AppSizes.pH20,
          ),
          surahDetails.surahName != 'الفاتحة'
              ? CustomText(
                  'بسم الله الرحمن الرحيم',
                  textStyle: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontFamily: AppFonts.fontFamilyKatib),
                  context: context,
                  textAlign: TextAlign.end,
                )
              : SizedBox.fromSize(),
          surahDetails.surahName != 'الفاتحة'
              ? SizedBox(
                  height: AppSizes.pH20,
                )
              : SizedBox.fromSize(),
        ],
      ),
    );
  }
}
