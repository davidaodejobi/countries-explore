import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant/constant.dart';
import '../../../core/core.dart';
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
      child: Consumer(builder: (context, AppTheme theme, child) {
        return Container(
          height: 30.0,
          // margin: const EdgeInsets.only(
          //   top: 12.0,
          // ),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(
              color: theme.isDarkTheme
                  ? AppColor.darkGreyColor
                  : AppColor.lightGreyColor2,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
            boxShadow: theme.isDarkTheme
                ? []
                : [
                    const BoxShadow(
                      color: AppColor.lightGreyColor2,
                      blurRadius: 1.0,
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
                color: Theme.of(context).iconTheme.color,
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
        );
      }),
    );
  }
}
