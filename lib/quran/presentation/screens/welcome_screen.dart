import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/global/theme_color/theme_color_light.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/widgets/custom_text.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          CustomText.displayLarge(AppConstants.appTitle, context: context),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.pW87,
              vertical: AppSizes.pH18,
            ),
            child: CustomText.labelMedium(
              AppConstants.appBody,
              context: context,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizes.pW32, vertical: AppSizes.pH25),
            child: SizedBox(
              height: AppSizes.pH520,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: AppSizes.pH480,
                      width: AppSizes.widthFullScreen,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizes.br30),
                        color: ThemeColorLight.primaryColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            AppAssets.mushaf,
                            width: AppSizes.pW250,
                            height: AppSizes.pH250,
                          ),
                          SizedBox(
                            height: AppSizes.pH40,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSizes.mediumButtonHeight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: AppSizes.pW10),
                        child: CustomText.titleMedium(
                          AppConstants.getStart,
                          context: context,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
