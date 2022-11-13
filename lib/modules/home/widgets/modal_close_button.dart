import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant/constant.dart';
import '../../../core/core.dart';

class ModalCloseButton extends StatelessWidget {
  const ModalCloseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, AppTheme value, child) {
      return InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        borderRadius: BorderRadius.circular(5),
        child: Container(
          height: 16,
          width: 16,
          decoration: BoxDecoration(
            color: value.isDarkTheme
                ? AppColor.darkPlanetBgColor
                : AppColor.darkPlanetBgColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Icon(
            Icons.close,
            color: AppColor.darkGreyColor,
            size: 15,
          ),
        ),
      );
    });
  }
}
