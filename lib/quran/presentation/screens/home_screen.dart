import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/core/global/theme_color/theme_color_light.dart';
import 'package:quran_app/core/services/service_locator.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_constants.dart';
import 'package:quran_app/core/utils/app_sizes.dart';
import 'package:quran_app/core/widgets/custom_text.dart';
import 'package:quran_app/core/widgets/images/custom_svg_image.dart';
import 'package:quran_app/quran/presentation/widgets/get_bookmarks_widget.dart';
import 'package:quran_app/quran/presentation/widgets/get_juz_widget.dart';
import 'package:quran_app/quran/presentation/widgets/last_read_widget.dart';

import '../../business/home_cubit/quran_cubit.dart';
import '../widgets/get_surahs_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<QuranCubit>()
        ..getSurahData()
        ..getLastRead(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            padding: EdgeInsets.only(
                left: AppSizes.pW16, top: AppSizes.pH16, bottom: AppSizes.pH16),
            onPressed: () async {
              // ThemeBloc.get(context)
              //     .add(const SaveThemeEvent(appTheme: AppTheme.light));
            },
            icon: SvgPicture.asset(
              AppAssets.menu,
              color: ThemeColorLight.grayscaleBold,
            ),
          ),
          title: CustomText.displayMedium(
            AppConstants.appTitle,
            context: context,
          ),
          actions: [
            CustomSvgImage.icons(
              path: AppAssets.search,
              color: ThemeColorLight.grayscale,
            ),
            SizedBox(
              width: AppSizes.pW16,
            )
          ],
        ),
        body: DefaultTabController(
          length: 3,
          child: Padding(
            padding: EdgeInsets.only(
              right: AppSizes.pW16,
              left: AppSizes.pW16,
              top: AppSizes.pH20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.labelLarge(
                  AppConstants.salamuAlaikum,
                  context: context,
                ),
                const LastReadWidget(),
                TabBar(
                  indicatorColor: ThemeColorLight.primaryColor,
                  tabs: const [
                    Tab(
                      text: AppConstants.surah,
                    ),
                    Tab(
                      text: AppConstants.juz,
                    ),
                    Tab(
                      text: AppConstants.bookmark,
                    ),
                  ],
                ),
                const Expanded(
                  child: TabBarView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      GetSurahsWidget(),
                      GetJuzWidget(),
                      GetBookmarkWidget(),
                    ],
                  ),
                ),
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
