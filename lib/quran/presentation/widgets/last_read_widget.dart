import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/global/theme_color/theme_color_light.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/widgets/custom_text.dart';
import '../../business/home_cubit/quran_cubit.dart';
import '../screens/surah_details_screen.dart';

class LastReadWidget extends StatelessWidget {
  const LastReadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        QuranCubit quranCubit = QuranCubit.get(context);
        if (quranCubit.lastRead != null) {
          return FutureBuilder(
              future: quranCubit.getLastRead(),
              builder: (context, snapshot) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SurahDetailsScreen(
                          surahName:
                              quranCubit.lastRead![AppConstants.columnSurah],
                          surahNo:
                              quranCubit.lastRead![AppConstants.columnSurahNo],
                          index: quranCubit
                              .lastRead![AppConstants.columnIndexAyah],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: AppSizes.pW12),
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.pW10),
                    width: AppSizes.widthFullScreen,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizes.br10),
                      color: ThemeColorLight.lightPurpleColor,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.pW10,
                              vertical: AppSizes.pH20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.menu_book_rounded,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: AppSizes.pW6,
                                  ),
                                  CustomText.titleMedium(AppConstants.lastRead,
                                      context: context)
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: AppSizes.pH25, bottom: AppSizes.pH4),
                                child: CustomText.titleLarge(
                                    quranCubit
                                        .lastRead![AppConstants.columnSurah],
                                    context: context),
                              ),
                              CustomText.titleSmall(
                                  AppConstants.ayahNo(quranCubit
                                      .lastRead![AppConstants.columnAyah]),
                                  context: context),
                            ],
                          ),
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          AppAssets.mushaf,
                          width: AppSizes.pW153,
                          height: AppSizes.pH150,
                        ),
                      ],
                    ),
                  ),
                );
              });
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
