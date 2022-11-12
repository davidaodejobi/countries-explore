import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant/constant.dart';
import '../../../core/core.dart';

class ScrollButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  const ScrollButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Consumer(
        builder: (context, AppTheme value, child) {
          return CircleAvatar(
            radius: 14,
            backgroundColor: value.isDarkTheme
                ? Colors.white.withOpacity(0.3)
                : Colors.black.withOpacity(0.3),
            child: Icon(icon,
                size: 14,
                color: value.isDarkTheme
                    ? AppColor.lightBackgroundColor
                    : AppColor.darkBackgroundColor),
          );
        },
      ),
    );
  }
}
