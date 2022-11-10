import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant/constant.dart';
import '../../../core/utils/utils.dart';
import '../../../shared/shared.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Explore',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const XMargin(1),
              Text(
                '.',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.w900,
                      color: AppColor
                          .logoDotColor, // AppColor.logoDotColor is a constant
                    ),
              ),
            ],
          ),
          Consumer<AppTheme>(builder: (context, value, child) {
            return GestureDetector(
              onTap: () => value.toggleTheme(),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: !value.isDarkTheme
                    ? AppColor.planetBgColor
                    : AppColor.darkPlanetBgColor.withOpacity(0.2),
                child: Icon(
                  !value.isDarkTheme
                      ? Icons.wb_sunny_outlined
                      : Icons.bedtime_outlined,
                  size: 20,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
