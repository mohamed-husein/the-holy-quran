import 'package:flutter/material.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/widgets/custom_text.dart';
import '../screens/juz_details_screen.dart';

class GetJuzWidget extends StatelessWidget {
  const GetJuzWidget({super.key});

  List<int> getJuzNumber() {
    List<int> juzNo = [];
    for (int i = 1; i <= 30; i++) {
      juzNo.add(i);
    }
    return juzNo;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: getJuzNumber().length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  JuzDetailsScreen(juzNum: getJuzNumber()[index],index: 0),
                ));
          },
          child: ListTile(
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
                  getJuzNumber()[index].toString(),
                  context: context,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            title: CustomText(
              AppConstants.juzName[index].trim(),
              textStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontFamily: AppFonts.fontFamilyKatib, height: 2),
              context: context,
              textAlign: TextAlign.start,
            ),
          ),
        );
      },
    );
  }
}
