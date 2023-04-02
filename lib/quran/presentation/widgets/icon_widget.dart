import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/global/theme_color/theme_color_light.dart';
import '../../../core/utils/app_sizes.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required this.onPressed, required this.icon});

  final VoidCallback onPressed;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.pW8,
            vertical: AppSizes.pH8,
          ),
          child: SvgPicture.asset(
            icon,
            color: ThemeColorLight.lightPurpleColor,
          ),
        ));
  }
}
