import 'package:flutter/material.dart';

import '../../../constant/constant.dart';

class CarouselButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  const CarouselButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        radius: 14,
        backgroundColor: Colors.white.withOpacity(0.3),
        child: Icon(icon, size: 14, color: AppColor.lightBackgroundColor),
      ),
    );
  }
}
