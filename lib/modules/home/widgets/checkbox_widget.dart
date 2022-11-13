import 'package:explore/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckBoxWidget extends StatelessWidget {
  CheckBoxWidget({
    Key? key,
    required this.check,
    required this.function,
    this.height,
    this.width,
  }) : super(key: key);
  final Function function;
  bool check;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, AppTheme theme, __) {
        return GestureDetector(
          onTap: () => function(!check),
          child: Container(
              height: height ?? 15,
              width: width ?? 15,
              decoration: BoxDecoration(
                border: Border.all(
                  color: theme.isDarkTheme ? Colors.white : Colors.black,
                ),
                color: check
                    ? theme.isDarkTheme
                        ? Colors.white
                        : Colors.black
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
              ),
              child: check
                  ? Icon(
                      Icons.check,
                      size: 10,
                      color: theme.isDarkTheme ? Colors.black : Colors.white,
                    )
                  : const SizedBox.shrink()),
        );
      },
    );
  }
}
