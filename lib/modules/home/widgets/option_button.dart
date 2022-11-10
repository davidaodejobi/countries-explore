import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../shared/shared.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  const OptionButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30.0,
        margin: const EdgeInsets.only(
          top: 12.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColor.lightGreyColor2,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          boxShadow: const [
            BoxShadow(
              color: AppColor.lightGreyColor2,
              blurRadius: 2.0,
              spreadRadius: 1.0,
              offset: Offset(0.0, 1.0),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColor.lightGreyColor,
              size: 18.0,
            ),
            const XMargin(3),
            Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ).paddingHorizontal(),
      ),
    );
  }
}
