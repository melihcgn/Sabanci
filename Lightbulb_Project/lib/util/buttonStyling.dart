
import 'package:flutter/material.dart';
import 'package:project_file/util/colors.dart';

class ButtonStyling {
  static get lsButton => BoxDecoration(
    gradient: const RadialGradient(
      colors: [
        AppColors.secondaryDark,
        AppColors.secondaryLight
      ],
      center: Alignment.topLeft,
      radius: 8,
    ),
    borderRadius: BorderRadius.circular(10),
  );
}

class ButtonStylingAlter {
  static get lsButton => BoxDecoration(
    gradient: const RadialGradient(
      colors: [
        AppColors.primaryLightest,
        AppColors.grey,
      ],
      center: Alignment.topLeft,
      radius: 8,
    ),
    borderRadius: BorderRadius.circular(10),
  );
}
class FollowerFollowingStyle {
  static get lsButton => BoxDecoration(
    border: Border.all(
      width: 1,
      color: AppColors.white,
    ),
    borderRadius: BorderRadius.circular(10),
  );
}
class CreateButtonStyling {
  static get lsButton => BoxDecoration(
    gradient: const RadialGradient(
      colors: [
        AppColors.secondaryDark,
        AppColors.secondaryLight
      ],
      center: Alignment.topLeft,
      radius: 8,
    ),
    borderRadius: BorderRadius.circular(20),
  );
}