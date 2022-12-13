import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_fonts.dart';
import 'package:quran_app/core/utils/app_sizes.dart';
import 'package:quran_app/core/widgets/custom_text.dart';
import 'package:quran_app/quran/presentation/screens/surah_details_screen.dart';

import '../../business/home_cubit/quran_cubit.dart';

class GetSurahsWidget extends StatelessWidget {
  const GetSurahsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final quranCubit = QuranCubit.get(context);
        if (quranCubit.surah.isNotEmpty) {
          return ListView.builder(
            itemCount: quranCubit.surah.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final surah = quranCubit.surah[index];
              return ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: AppSizes.pW10),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return SurahDetailsScreen(surahName: surah.surahNameEn,surahNo: surah.number,index: 0,);
                      },
                    ),
                  );
                },
                leading: Container(
                  height: AppSizes.pH40,
                  width: AppSizes.pW40,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.octagonal),
                    ),
                  ),
                  child: Center(
                    child: CustomText.bodySmall(
                      surah.number.toString(),
                      context: context,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                title: CustomText.bodyMedium(
                  surah.surahNameEn,
                  context: context,
                  textAlign: TextAlign.start,
                ),
                subtitle: CustomText.labelSmall(
                  '${surah.numberOfVerses} AYAT | ${surah.revelationEn.toUpperCase()}',
                  context: context,
                  textAlign: TextAlign.start,
                ),
                trailing: CustomText.displaySmall(
                  surah.surahName,
                  context: context,
                  textAlign: TextAlign.start,
                  fontFamily: AppFonts.fontFamilyKatib,
                ),
              );
            },
          );
        } else {
          return Center(
            child: Lottie.asset(AppAssets.loading, width: 500, height: 200),
          );
        }
      },
    );
  }
}
